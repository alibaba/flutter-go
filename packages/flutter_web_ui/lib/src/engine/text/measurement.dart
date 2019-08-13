// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of engine;

const bool _experimentalEnableCanvasImplementation = false;

// TODO(yjbanov): this is a hack we use to compute ideographic baseline; this
//                number is the ratio ideographic/alphabetic for font Ahem,
//                which matches the Flutter number. It may be completely wrong
//                for any other font. We'll need to eventually fix this. That
//                said Flutter doesn't seem to use ideographic baseline for
//                anything as of this writing.
const double _baselineRatioHack = 1.1662499904632568;

/// Signature of a function that takes a character and returns true or false.
typedef CharPredicate = bool Function(int char);

bool _whitespacePredicate(int char) =>
    char == CharCode.space || char == CharCode.tab || _newlinePredicate(char);
bool _newlinePredicate(int char) =>
    char == CharCode.cr || char == CharCode.lf || char == CharCode.nl;

/// Manages [ParagraphRuler] instances and caches them per unique
/// [ParagraphGeometricStyle].
///
/// All instances of [ParagraphRuler] should be created through this class.
class RulerManager {
  RulerManager({@required this.rulerCacheCapacity}) {
    _rulerHost.style
      ..position = 'fixed'
      ..visibility = 'hidden'
      ..overflow = 'hidden'
      ..top = '0'
      ..left = '0'
      ..width = '0'
      ..height = '0';
    html.document.body.append(_rulerHost);
    registerHotRestartListener(dispose);
  }

  final int rulerCacheCapacity;

  /// Hosts a cache of rulers that measure text.
  ///
  /// This element exists purely for organizational purposes. Otherwise the
  /// rulers would be attached to the `<body>` element polluting the element
  /// tree and making it hard to navigate. It does not serve any functional
  /// purpose.
  final html.Element _rulerHost = html.Element.tag('flt-ruler-host');

  /// The cache of rulers used to measure text.
  ///
  /// Each ruler is keyed by paragraph style. This allows us to setup the
  /// ruler's DOM structure once during the very first measurement of a given
  /// paragraph style. Subsequent measurements could reuse the same ruler and
  /// only swap the text contents. This minimizes the amount of work a browser
  /// needs to do when measure many pieces of text with the same style.
  ///
  /// What makes this cache effective is the fact that a typical application
  /// only uses a limited number of text styles. Using too many text styles on
  /// the same screen is considered bad for user experience.
  Map<ParagraphGeometricStyle, ParagraphRuler> get rulers => _rulers;
  Map<ParagraphGeometricStyle, ParagraphRuler> _rulers =
      <ParagraphGeometricStyle, ParagraphRuler>{};

  bool _rulerCacheCleanupScheduled = false;

  void _scheduleRulerCacheCleanup() {
    if (!_rulerCacheCleanupScheduled) {
      _rulerCacheCleanupScheduled = true;
      scheduleMicrotask(() {
        _rulerCacheCleanupScheduled = false;
        cleanUpRulerCache();
      });
    }
  }

  /// Releases the resources used by this [RulerManager].
  ///
  /// After this is called, this object is no longer usable.
  void dispose() {
    _rulerHost?.remove();
  }

  /// If ruler cache size exceeds [rulerCacheCapacity], evicts those rulers that
  /// were used the least.
  ///
  /// Resets hit counts back to zero.
  @visibleForTesting
  void cleanUpRulerCache() {
    if (_rulers.length > rulerCacheCapacity) {
      final List<ParagraphRuler> sortedByUsage = _rulers.values.toList();
      sortedByUsage.sort((ParagraphRuler a, ParagraphRuler b) {
        return b.hitCount - a.hitCount;
      });
      _rulers = <ParagraphGeometricStyle, ParagraphRuler>{};
      for (int i = 0; i < sortedByUsage.length; i++) {
        final ParagraphRuler ruler = sortedByUsage[i];
        ruler.resetHitCount();
        if (i < rulerCacheCapacity) {
          // Retain this ruler.
          _rulers[ruler.style] = ruler;
        } else {
          // This ruler did not have enough usage this frame to be retained.
          ruler.dispose();
        }
      }
    }
  }

  /// Adds an element used for measuring text as a child of [_rulerHost].
  void addHostElement(html.DivElement element) {
    _rulerHost.append(element);
  }

  /// Performs a cache lookup to find an existing [ParagraphRuler] for the given
  /// [style] and if it can't find one in the cache, it would create one.
  ///
  /// The returned ruler is marked as hit so there's no need to do that
  /// elsewhere.
  @visibleForTesting
  ParagraphRuler findOrCreateRuler(ParagraphGeometricStyle style) {
    ParagraphRuler ruler = _rulers[style];
    if (ruler == null) {
      if (assertionsEnabled) {
        domRenderer.debugRulerCacheMiss();
      }
      ruler = _rulers[style] = ParagraphRuler(style, this);
      _scheduleRulerCacheCleanup();
    } else {
      if (assertionsEnabled) {
        domRenderer.debugRulerCacheHit();
      }
    }
    ruler.hit();
    return ruler;
  }
}

/// Provides various text measurement APIs using either a dom-based approach
/// in [DomTextMeasurementService], or a canvas-based approach in
/// [CanvasTextMeasurementService].
abstract class TextMeasurementService {
  /// Initializes the text measurement service with a specific
  /// [rulerCacheCapacity] that gets passed to the [RulerManager].
  static void initialize({@required int rulerCacheCapacity}) {
    clearCache();
    rulerManager = RulerManager(rulerCacheCapacity: rulerCacheCapacity);
  }

  @visibleForTesting
  static RulerManager rulerManager;

  /// The DOM-based text measurement service.
  @visibleForTesting
  static TextMeasurementService get domInstance =>
      DomTextMeasurementService.instance;

  /// The canvas-based text measurement service.
  @visibleForTesting
  static TextMeasurementService get canvasInstance =>
      CanvasTextMeasurementService.instance;

  /// Gets the appropriate [TextMeasurementService] instance for the given
  /// [paragraph].
  static TextMeasurementService forParagraph(ui.Paragraph paragraph) {
    // TODO(flutter_web): https://github.com/flutter/flutter/issues/33523
    // When the canvas-based implementation is complete and passes all the
    // tests, get rid of [_experimentalEnableCanvasImplementation].
    if (_experimentalEnableCanvasImplementation &&
        _canUseCanvasMeasurement(paragraph)) {
      return canvasInstance;
    }
    return domInstance;
  }

  /// Clears the cache of paragraph rulers.
  @visibleForTesting
  static void clearCache() {
    rulerManager?.dispose();
    rulerManager = null;
  }

  static bool _canUseCanvasMeasurement(ui.Paragraph paragraph) {
    // Currently, the canvas-based approach only works on plain text that
    // doesn't have any of the following styles:
    // - decoration
    // - letter spacing
    // - word spacing
    final ParagraphGeometricStyle style =
        paragraph.webOnlyGetParagraphGeometricStyle();
    return paragraph.webOnlyGetPlainText() != null &&
        style.decoration == null &&
        style.letterSpacing == null &&
        style.wordSpacing == null;
  }

  /// Measures the paragraph and returns a [MeasurementResult] object.
  MeasurementResult measure(
    ui.Paragraph paragraph,
    ui.ParagraphConstraints constraints,
  ) {
    final ParagraphGeometricStyle style =
        paragraph.webOnlyGetParagraphGeometricStyle();
    final ParagraphRuler ruler =
        TextMeasurementService.rulerManager.findOrCreateRuler(style);

    if (assertionsEnabled) {
      if (paragraph.webOnlyGetPlainText() == null) {
        domRenderer.debugRichTextLayout();
      } else {
        domRenderer.debugPlainTextLayout();
      }
    }

    MeasurementResult result = ruler.cacheLookup(paragraph, constraints);
    if (result != null) {
      return result;
    }

    result = _doMeasure(paragraph, constraints, ruler);
    ruler.cacheMeasurement(paragraph, result);
    return result;
  }

  /// Measures the width of a substring of the given [paragraph] with no
  /// constraints.
  double measureSubstringWidth(ui.Paragraph paragraph, int start, int end);

  /// Delegates to a [ParagraphRuler] to measure a list of text boxes that
  /// enclose the given range of text.
  List<ui.TextBox> measureBoxesForRange(
    ui.Paragraph paragraph,
    ui.ParagraphConstraints constraints, {
    int start,
    int end,
    double alignOffset,
    ui.TextDirection textDirection,
  }) {
    final ParagraphGeometricStyle style =
        paragraph.webOnlyGetParagraphGeometricStyle();
    final ParagraphRuler ruler =
        TextMeasurementService.rulerManager.findOrCreateRuler(style);

    return ruler.measureBoxesForRange(
      paragraph.webOnlyGetPlainText(),
      constraints,
      start: start,
      end: end,
      alignOffset: alignOffset,
      textDirection: textDirection,
    );
  }

  /// Performs the actual measurement of the following values for the given
  /// paragraph:
  ///
  /// * isSingleLine: whether the paragraph can be rendered in a single line.
  /// * height: constrained measure of the entire paragraph's height.
  /// * lineHeight: the height of a single line of the paragraph.
  /// * alphabeticBaseline: single line measure.
  /// * ideographicBaseline: based on [alphabeticBaseline].
  /// * maxIntrinsicWidth: the width of the paragraph with no line-wrapping.
  /// * minIntrinsicWidth: the min width the paragraph fits in without overflowing.
  ///
  /// [MeasurementResult.width] is set to the same value of [constraints.width].
  ///
  /// It also optionally computes [MeasurementResult.lines] in the given
  /// paragraph. When that's available, it can be used by a canvas to render
  /// the text line.
  MeasurementResult _doMeasure(
    ui.Paragraph paragraph,
    ui.ParagraphConstraints constraints,
    ParagraphRuler ruler,
  );
}

/// A DOM-based text measurement implementation.
///
/// This implementation is slower than [CanvasTextMeasurementService] but it's
/// needed for some cases that aren't yet supported in the canvas-based
/// implementation such as letter-spacing, word-spacing, etc.
class DomTextMeasurementService extends TextMeasurementService {
  /// The text measurement service singleton.
  static DomTextMeasurementService get instance =>
      _instance ??= DomTextMeasurementService();

  static DomTextMeasurementService _instance;

  @override
  MeasurementResult _doMeasure(
    ui.Paragraph paragraph,
    ui.ParagraphConstraints constraints,
    ParagraphRuler ruler,
  ) {
    ruler.willMeasure(paragraph);
    final String plainText = paragraph.webOnlyGetPlainText();

    ruler.measureAll(constraints);

    MeasurementResult result;
    // When the text has a new line, we should always use multi-line mode.
    final bool hasNewline = plainText?.contains('\n') ?? false;
    if (!hasNewline && ruler.singleLineDimensions.width <= constraints.width) {
      result = _measureSingleLineParagraph(ruler, paragraph, constraints);
    } else {
      // Assert: If text doesn't have new line for infinite constraints we
      // should have called single line measure paragraph instead.
      assert(hasNewline || constraints.width != double.infinity);
      result = _measureMultiLineParagraph(ruler, paragraph, constraints);
    }
    ruler.didMeasure();
    return result;
  }

  @override
  double measureSubstringWidth(ui.Paragraph paragraph, int start, int end) {
    final ParagraphGeometricStyle style =
        paragraph.webOnlyGetParagraphGeometricStyle();
    final ParagraphRuler ruler =
        TextMeasurementService.rulerManager.findOrCreateRuler(style);

    final String text = paragraph.webOnlyGetPlainText().substring(start, end);
    final ui.Paragraph substringParagraph =
        paragraph.webOnlyCloneWithText(text);

    ruler.willMeasure(substringParagraph);
    ruler.measureAsSingleLine();
    final TextDimensions dimensions = ruler.singleLineDimensions;
    ruler.didMeasure();
    return dimensions.width;
  }

  /// Called when we have determined that the paragraph fits the [constraints]
  /// without wrapping.
  ///
  /// This means that:
  /// * `width == maxIntrinsicWidth` - we gave it more horizontal space than
  ///   it needs and so the paragraph won't expand beyond `maxIntrinsicWidth`.
  /// * `height` is the height computed by `measureAsSingleLine`; giving the
  ///    paragraph the width constraint won't change its height as we already
  ///    determined that it fits within the constraint without wrapping.
  /// * `alphabeticBaseline` is also final for the same reason as the `height`
  ///   value.
  ///
  /// This method still needs to measure `minIntrinsicWidth`.
  MeasurementResult _measureSingleLineParagraph(ParagraphRuler ruler,
      ui.Paragraph paragraph, ui.ParagraphConstraints constraints) {
    final double width = constraints.width;
    final double minIntrinsicWidth = ruler.minIntrinsicDimensions.width;
    double maxIntrinsicWidth = ruler.singleLineDimensions.width;
    final double alphabeticBaseline = ruler.alphabeticBaseline;
    final double height = ruler.singleLineDimensions.height;

    maxIntrinsicWidth =
        _applySubPixelRoundingHack(minIntrinsicWidth, maxIntrinsicWidth);
    final double ideographicBaseline = alphabeticBaseline * _baselineRatioHack;
    return MeasurementResult(
      constraints.width,
      isSingleLine: true,
      width: width,
      height: height,
      naturalHeight: height,
      minIntrinsicWidth: minIntrinsicWidth,
      maxIntrinsicWidth: maxIntrinsicWidth,
      alphabeticBaseline: alphabeticBaseline,
      ideographicBaseline: ideographicBaseline,
      lines: null,
    );
  }

  /// Called when we have determined that the paragraph needs to wrap into
  /// multiple lines to fit the [constraints], i.e. its `maxIntrinsicWidth` is
  /// bigger than the available horizontal space.
  ///
  /// While `maxIntrinsicWidth` is still good from the call to
  /// `measureAsSingleLine`, we need to re-measure with the width constraint
  /// and get new values for width, height and alphabetic baseline. We also need
  /// to measure `minIntrinsicWidth`.
  MeasurementResult _measureMultiLineParagraph(ParagraphRuler ruler,
      ui.Paragraph paragraph, ui.ParagraphConstraints constraints) {
    // If constraint is infinite, we must use _measureSingleLineParagraph
    final double width = constraints.width;
    final double minIntrinsicWidth = ruler.minIntrinsicDimensions.width;
    double maxIntrinsicWidth = ruler.singleLineDimensions.width;
    final double alphabeticBaseline = ruler.alphabeticBaseline;
    // Natural height is the full height of text ignoring height constraints.
    final double naturalHeight = ruler.constrainedDimensions.height;

    double height;
    final int maxLines = paragraph.webOnlyGetParagraphGeometricStyle().maxLines;
    if (maxLines == null) {
      height = naturalHeight;
    } else {
      // Lazily compute [lineHeight] when [maxLines] is not null.
      final double lineHeight = ruler.lineHeightDimensions.height;
      height = math.min(naturalHeight, maxLines * lineHeight);
    }

    maxIntrinsicWidth =
        _applySubPixelRoundingHack(minIntrinsicWidth, maxIntrinsicWidth);
    assert(minIntrinsicWidth <= maxIntrinsicWidth);
    final double ideographicBaseline = alphabeticBaseline * _baselineRatioHack;
    return MeasurementResult(
      constraints.width,
      isSingleLine: false,
      width: width,
      height: height,
      naturalHeight: naturalHeight,
      minIntrinsicWidth: minIntrinsicWidth,
      maxIntrinsicWidth: maxIntrinsicWidth,
      alphabeticBaseline: alphabeticBaseline,
      ideographicBaseline: ideographicBaseline,
      lines: null,
    );
  }

  /// This hack is needed because `offsetWidth` rounds the value to the nearest
  /// whole number. On a very rare occasion the minimum intrinsic width reported
  /// by the browser is slightly bigger than the reported maximum intrinsic
  /// width. If the discrepancy overlaps 0.5 then the rounding happens in
  /// opposite directions.
  ///
  /// For example, if minIntrinsicWidth == 99.5 and maxIntrinsicWidth == 99.48,
  /// then minIntrinsicWidth is rounded up to 100, and maxIntrinsicWidth is
  /// rounded down to 99.
  // TODO(yjbanov): remove the need for this hack.
  static double _applySubPixelRoundingHack(
      double minIntrinsicWidth, double maxIntrinsicWidth) {
    if (minIntrinsicWidth <= maxIntrinsicWidth) {
      return maxIntrinsicWidth;
    }

    if (minIntrinsicWidth - maxIntrinsicWidth < 2.0) {
      return minIntrinsicWidth;
    }

    throw Exception('minIntrinsicWidth ($minIntrinsicWidth) is greater than '
        'maxIntrinsicWidth ($maxIntrinsicWidth).');
  }
}

/// A canvas-based text measurement implementation.
///
/// This is a faster implementation than [DomTextMeasurementService] and
/// provides line breaks information that can be useful for multi-line text.
class CanvasTextMeasurementService extends TextMeasurementService {
  /// The text measurement service singleton.
  static CanvasTextMeasurementService get instance =>
      _instance ??= CanvasTextMeasurementService();

  static CanvasTextMeasurementService _instance;

  final html.CanvasRenderingContext2D _canvasContext =
      html.CanvasElement().context2D;

  @override
  MeasurementResult _doMeasure(
    ui.Paragraph paragraph,
    ui.ParagraphConstraints constraints,
    ParagraphRuler ruler,
  ) {
    final String text = paragraph.webOnlyGetPlainText();
    final ParagraphGeometricStyle style =
        paragraph.webOnlyGetParagraphGeometricStyle();
    assert(text != null);

    // TODO(mdebbar): Check if the whole text can fit in a single-line. Then avoid all this ceremony.
    _canvasContext.font = style.cssFontString;

    final double maxWidth = constraints.width;
    final bool hasEllipsis = style.ellipsis != null;

    final List<String> lines = <String>[];
    int lineStart = 0;

    // Indicates whether we've reached the end of text or not. Even if the index
    // [i] reaches the end of text, we don't want to stop looping until we hit
    // [LineBreakType.endOfText] because there could be a "\n" at the end of the
    // string and that would mess things up.
    bool reachedEndOfText = false;

    // The maximum number of lines to be measured and displayed. This value may
    // change throughout the loop below. Specifically, when [style.maxLines] is
    // null, the value of [lineCountLimit] will be updated during the loop when we
    // find the line we should stop at.
    int lineCountLimit = style.maxLines ?? double.infinity;
    bool unlimitedLines() => lineCountLimit == double.infinity;

    // TODO(mdebbar): Avoid these closures. They generate bad JS code.
    void addLineBreak(int index) {
      if (lines.length < lineCountLimit) {
        lines.add(text.substring(lineStart, index));
      }
      lineStart = index;
    }

    double ellipsisWidth;
    double getEllipsisWidth() {
      // Cache the width of the ellipsis to avoid computing it multiple times in
      // the loop below.
      return ellipsisWidth ??=
          _roundWidth(_canvasContext.measureText(style.ellipsis).width);
    }

    // The index marking the end of the last unbreakable chunk of text.
    int lastChunkEnd = 0;
    double minIntrinsicWidth = 0;

    void processMinIntrinsicWidth(int chunkEnd, int chunkEndWithoutSpace) {
      final double width =
          _measureSubstring(text, lastChunkEnd, chunkEndWithoutSpace);
      if (width > minIntrinsicWidth) {
        minIntrinsicWidth = width;
      }
      lastChunkEnd = chunkEnd;
    }

    // The index marking the end of the last hard line break.
    int lastHardLineEnd = 0;
    double maxIntrinsicWidth = 0;

    void processMaxIntrinsicWidth(int hardLineEnd) {
      // The continuous line is the chunk of text since the last mandatory
      // line break.
      final int continuousLineEnd = _excludeTrailing(
        text,
        lastHardLineEnd,
        hardLineEnd,
        _newlinePredicate,
      );
      final double continuousLineWidth =
          _measureSubstring(text, lastHardLineEnd, continuousLineEnd);
      if (continuousLineWidth > maxIntrinsicWidth) {
        maxIntrinsicWidth = continuousLineWidth;
      }
      lastHardLineEnd = hardLineEnd;
    }

    // TODO(flutter_web): Chrome & Safari return more info from [canvasContext.measureText].
    int i = 0;
    while (!reachedEndOfText) {
      final LineBreakResult brk = nextLineBreak(text, i);
      final int chunkEnd = brk.index;
      final int chunkEndWithoutSpace =
          _excludeTrailing(text, i, brk.index, _whitespacePredicate);
      final double lineWidth =
          _measureSubstring(text, lineStart, chunkEndWithoutSpace);

      if (lineWidth > maxWidth) {
        // If the current chunk starts at the beginning of the line and exceeds
        // [maxWidth], then we will need to force-break it.
        final bool isSingleChunk = i == lineStart;
        // When ellipsis is set, and maxLines is null, we stop at the first line
        // that exceeds [maxWidth].
        final bool isLastLine = (hasEllipsis && unlimitedLines()) ||
            lines.length == lineCountLimit - 1;

        if (isSingleChunk || isLastLine) {
          // When ellipsis is set, show it on the last line of text.
          if (isLastLine) {
            // Truncate text to leave enough space for the ellipsis then pretty
            // much stop everything at this point.
            final double availableWidth = maxWidth - getEllipsisWidth();
            final int breakingPoint = _forceBreak(
                availableWidth, text, lineStart, chunkEndWithoutSpace);
            lines.add(text.substring(i, breakingPoint) + style.ellipsis);
            // Set [lineCountLimit] to the current number of lines to prevent
            // adding any more lines since we already reached a line that
            // overflows.
            lineCountLimit = lines.length;
          } else {
            final int breakingPoint =
                _forceBreak(maxWidth, text, lineStart, chunkEndWithoutSpace);
            addLineBreak(breakingPoint);
            // Skip the remainder of the loop since this was a forced line
            // break that doesn't affect min/maxIntrinsicWidth.
            i = breakingPoint;
            continue;
          }
        } else {
          // The control case of current line reaching [maxWidth], we break the
          // line.
          addLineBreak(i);
        }
      }

      processMinIntrinsicWidth(chunkEnd, chunkEndWithoutSpace);

      if (brk.type == LineBreakType.mandatory ||
          brk.type == LineBreakType.endOfText) {
        processMaxIntrinsicWidth(brk.index);
        addLineBreak(brk.index);
        if (brk.type == LineBreakType.endOfText) {
          reachedEndOfText = true;
        }
      }
      i = brk.index;
    }

    final int lineCount = lines.length;
    final double lineHeight = ruler.lineHeightDimensions.height;
    final double naturalHeight = lineCount * lineHeight;

    final double height = style.maxLines == null
        ? naturalHeight
        : math.min(lineCount, style.maxLines) * lineHeight;

    final MeasurementResult result = MeasurementResult(
      maxWidth,
      isSingleLine: lineCount == 1,
      alphabeticBaseline: ruler.alphabeticBaseline,
      ideographicBaseline: ruler.alphabeticBaseline * _baselineRatioHack,
      height: height,
      naturalHeight: naturalHeight,
      // `minIntrinsicWidth` is the greatest width of text that can't
      // be broken down into multiple lines.
      minIntrinsicWidth: minIntrinsicWidth,
      // `maxIntrinsicWidth` is the width of the widest piece of text
      // that doesn't contain mandatory line breaks.
      maxIntrinsicWidth: maxIntrinsicWidth,
      width: maxWidth,
      lines: lines,
    );
    return result;
  }

  @override
  double measureSubstringWidth(ui.Paragraph paragraph, int start, int end) {
    final String text = paragraph.webOnlyGetPlainText();
    final ParagraphGeometricStyle style =
        paragraph.webOnlyGetParagraphGeometricStyle();
    _canvasContext.font = style.cssFontString;
    return _measureSubstring(text, start, end);
  }

  int _lastStart;
  int _lastEnd;
  String _lastText;
  double _lastWidth;

  /// Measures the width of the substring of [text] starting from the index
  /// [start] (inclusive) to [end] (exclusive).
  ///
  /// This method assumes that the correct font has already been set on
  /// [_canvasContext].
  double _measureSubstring(String text, int start, int end) {
    // 0 <= start <= end <= text.length
    assert(0 <= start && start <= end && end <= text.length);

    if (start == end) {
      return 0;
    }

    if (start == _lastStart && end == _lastEnd && text == _lastText) {
      return _lastWidth;
    }
    _lastStart = start;
    _lastEnd = end;
    _lastText = text;

    final String sub = text.substring(start, end);
    final double width = _canvasContext.measureText(sub).width;

    // What we are doing here is we are rounding to the nearest 2nd decimal
    // point. So 39.999423 becomes 40, and 11.243982 becomes 11.24.
    // The reason we are doing this is because we noticed that canvas API has a
    // ±0.001 error margin.
    return _lastWidth = _roundWidth(width);
  }

  /// In a continuous block of text, finds the point where text can be broken to
  /// fit in the given constraint [maxWidth].
  ///
  /// This always returns at least one character even if there isn't enough
  /// space for it.
  int _forceBreak(double maxWidth, String text, int start, int end) {
    assert(0 <= start && start < end && end <= text.length);

    int low = start;
    int high = end;
    do {
      final int mid = (low + high) ~/ 2;
      final double width = _measureSubstring(text, start, mid);
      if (width < maxWidth) {
        low = mid;
      } else if (width > maxWidth) {
        high = mid;
      } else {
        low = high = mid;
      }
    } while (high - low > 1);

    // The breaking point should be at least one character away from [start].
    return math.max(low, start + 1);
  }
}

double _roundWidth(double width) {
  return (width * 100).round() / 100;
}

/// From the substring defined by [text], [start] (inclusive) and [end]
/// (exclusive), exclude trailing characters that satisfy the given [predicate].
///
/// The return value is the new end of the substring after excluding the
/// trailing characters.
int _excludeTrailing(String text, int start, int end, CharPredicate predicate) {
  assert(0 <= start && start <= end && end <= text.length);

  while (start < end && predicate(text.codeUnitAt(end - 1))) {
    end--;
  }
  return end;
}
