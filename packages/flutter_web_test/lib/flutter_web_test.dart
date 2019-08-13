// Synced 2019-05-30T14:20:57.788350.
import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:flutter_web_ui/src/engine.dart' as ui;
import 'package:html/parser.dart' as html_package;
import 'package:html/dom.dart' as html_package;
import 'package:test/test.dart' as test_package;

export 'dart:async' show Future;

export 'src/accessibility.dart';
export 'src/binding.dart';
export 'src/controller.dart';
export 'src/finders.dart';
export 'src/matchers.dart';
export 'src/nonconst.dart';
export 'src/test_async_utils.dart';
export 'src/test_pointer.dart';
export 'src/widget_tester.dart';
export 'src/window.dart';

/// Wrapper around Dart's [test_package.test] to ensure that Ahem font is
/// properly loaded before running tests.
void test(
  dynamic description,
  Function body, {
  String testOn,
  test_package.Timeout timeout,
  dynamic skip,
  dynamic tags,
  Map<String, dynamic> onPlatform,
  int retry,
}) {
  test_package.test(
    description,
    // TODO(flutter_web): remove this by wrapping tests in a test harness that
    //                    performs this initialization automatically.
    () => ui.ensureTestPlatformInitializedThenRunTest(body),
    testOn: testOn,
    timeout: timeout,
    skip: skip,
    tags: tags,
    onPlatform: onPlatform,
    retry: retry,
  );
}

/// Controls how test HTML is canonicalized by [canonicalizeHtml] function.
///
/// In all cases whitespace between elements is stripped.
enum HtmlComparisonMode {
  /// Retains all attributes.
  ///
  /// Useful when very precise HTML comparison is needed that includes both
  /// layout and non-layout style attributes. This mode is rarely needed. Most
  /// tests should use [layoutOnly] or [nonLayoutOnly].
  everything,

  /// Retains only layout style attributes, such as "width".
  ///
  /// Useful when testing layout because it filters out all the noise that does
  /// not affect layout.
  layoutOnly,

  /// Retains only non-layout style attributes, such as "color".
  ///
  /// Useful when testing styling because it filters out all the noise from the
  /// layout attributes.
  nonLayoutOnly,
}

/// Rewrites [html] by removing irrelevant style attributes.
///
/// If [throwOnUnusedAttributes] is `true`, throws instead of rewriting. Set
/// [throwOnUnusedAttributes] to `true` to check that expected HTML strings do
/// not contain irrelevant attributes. It is ok for actual HTML to contain all
/// kinds of attributes. They only need to be filtered out before testing.
String canonicalizeHtml(String html,
    {HtmlComparisonMode mode = HtmlComparisonMode.nonLayoutOnly,
    bool throwOnUnusedAttributes = false}) {
  if (html == null || html.trim().isEmpty) {
    return '';
  }

  String _unusedAttribute(String name) {
    if (throwOnUnusedAttributes) {
      test_package.fail('Provided HTML contains style attribute "$name" which '
          'is not used for comparison in the test. The HTML was:\n\n$html');
    }

    return null;
  }

  html_package.Element _cleanup(html_package.Element original) {
    String replacementTag = original.localName;
    switch (replacementTag) {
      case 'flt-scene':
        replacementTag = 's';
        break;
      case 'flt-transform':
        replacementTag = 't';
        break;
      case 'flt-opacity':
        replacementTag = 'o';
        break;
      case 'flt-clip':
        final String clipType = original.attributes['clip-type'];
        switch (clipType) {
          case 'rect':
            replacementTag = 'clip';
            break;
          case 'rrect':
            replacementTag = 'rclip';
            break;
          case 'physical-shape':
            replacementTag = 'pshape';
            break;
          default:
            throw Exception('Unknown clip type: ${clipType}');
        }
        break;
      case 'flt-clip-interior':
        replacementTag = 'clip-i';
        break;
      case 'flt-picture':
        replacementTag = 'pic';
        break;
      case 'flt-canvas':
        replacementTag = 'c';
        break;
      case 'flt-dom-canvas':
        replacementTag = 'd';
        break;
      case 'flt-semantics':
        replacementTag = 'sem';
        break;
      case 'flt-semantics-container':
        replacementTag = 'sem-c';
        break;
      case 'flt-semantics-value':
        replacementTag = 'sem-v';
        break;
      case 'flt-semantics-img':
        replacementTag = 'sem-img';
        break;
      case 'flt-semantics-text-field':
        replacementTag = 'sem-tf';
        break;
    }

    html_package.Element replacement = html_package.Element.tag(replacementTag);

    original.attributes.forEach((dynamic name, String value) {
      if (name == 'style') {
        return;
      }
      if (name.startsWith('aria-')) {
        replacement.attributes[name] = value;
      }
    });

    if (original.attributes.containsKey('style')) {
      final styleValue = original.attributes['style'];

      int attrCount = 0;
      String processedAttributes = styleValue
          .split(';')
          .map((attr) {
            attr = attr.trim();
            if (attr.isEmpty) {
              return null;
            }

            if (mode != HtmlComparisonMode.everything) {
              final forLayout = mode == HtmlComparisonMode.layoutOnly;
              List<String> parts = attr.split(':');
              if (parts.length == 2) {
                String name = parts.first;
                // Whether the attribute is one that's set to the same value and
                // never changes. Such attributes are usually not interesting to
                // test.
                bool isStaticAttribute = const <String>[
                  'top',
                  'left',
                  'position',
                ].contains(name);

                if (isStaticAttribute) {
                  return _unusedAttribute(name);
                }

                // Whether the attribute is set by the layout system.
                bool isLayoutAttribute = const <String>[
                  'top',
                  'left',
                  'bottom',
                  'right',
                  'position',
                  'width',
                  'height',
                  'font-size',
                  'transform',
                  'transform-origin',
                  'white-space',
                ].contains(name);

                if (forLayout && !isLayoutAttribute ||
                    !forLayout && isLayoutAttribute) {
                  return _unusedAttribute(name);
                }
              }
            }

            attrCount++;
            return attr.trim();
          })
          .where((attr) => attr != null && attr.isNotEmpty)
          .join('; ');

      if (attrCount > 0) {
        replacement.attributes['style'] = processedAttributes;
      }
    }

    for (html_package.Node child in original.nodes) {
      if (child is html_package.Text && child.text.trim().isEmpty) {
        continue;
      }

      if (child is html_package.Element) {
        replacement.append(_cleanup(child));
      } else {
        replacement.append(child.clone(true));
      }
    }

    return replacement;
  }

  html_package.DocumentFragment originalDom = html_package.parseFragment(html);

  html_package.DocumentFragment cleanDom = html_package.DocumentFragment();
  for (var child in originalDom.children) {
    cleanDom.append(_cleanup(child));
  }

  void unexpectedSceneStructure() {
    test_package.fail(
      'The root scene element <s> (or <flt-scene>) must have a single '
      'child transform element <t> (or <flt-transform>), but found '
      '${cleanDom.children.length} children '
      '${originalDom.children.map((e) => '<${e.localName}>').join(', ')}',
    );
  }

  if (cleanDom.children.length == 1 &&
      cleanDom.children.first.localName == 's') {
    final scene = cleanDom.children.single;

    if (scene.children.length != 1) {
      unexpectedSceneStructure();
    }

    final rootTransform = scene.children.single;

    if (rootTransform.localName != 't') {
      unexpectedSceneStructure();
    }

    return rootTransform.children.map((e) => e.outerHtml).join('').trim();
  } else {
    return cleanDom.outerHtml;
  }
}

/// Tests that [currentHtml] matches [expectedHtml].
///
/// The comparison does not consider every minutia of the DOM. By default it
/// tests the element tree structure and non-layout style attributes, and
/// ignores everything else. If you are testing layout specifically, pass the
/// [HtmlComparisonMode.layoutOnly] as the [mode] argument.
///
/// To keep test HTML strings manageable, you may use short HTML tag names
/// instead of the full names:
///
/// * <flt-scene> is interchangeable with <s>
/// * <flt-transform> is interchangeable with <t>
/// * <flt-opacity> is interchangeable with <o>
/// * <flt-clip clip-type="rect"> is interchangeable with <clip>
/// * <flt-clip clip-type="rrect"> is interchangeable with <rclip>
/// * <flt-clip clip-type="physical-shape"> is interchangeable with <pshape>
/// * <flt-picture> is interchangeable with <pic>
/// * <flt-canvas> is interchangeable with <c>
///
/// To simplify test HTML strings further the elements corresponding to the
/// root view [RenderView], such as <flt-scene> (i.e. <s>), are also stripped
/// out before comparison.
///
/// Example:
///
/// If you call [WidgetTester.pumpWidget] that results in HTML
/// `<s><t><pic><c><p>Hello</p></c></pic></t></s>`, you don't have to specify
/// `<s><t>` tags and simply expect `<pic><c><p>Hello</p></c></pic>`.
void expectCurrentHtml(String expectedHtml,
    {HtmlComparisonMode mode = HtmlComparisonMode.nonLayoutOnly}) {
  expectedHtml = canonicalizeHtml(expectedHtml, mode: mode);
  String actualHtml = canonicalizeHtml(currentHtml, mode: mode);
  test_package.expect(actualHtml, expectedHtml);
}

/// Expects that we render a single picture layer.
///
/// The [expectedHtml] should only contain the _contents_ of the picture. It
/// should not contain the wrapper elements, such as `<flt-picture>` or
/// `<flt-canvas>`. Use this method to reduce the boilerplate in your test HTML
/// strings.
void expectPictureHtml(String expectedHtml,
    {HtmlComparisonMode mode = HtmlComparisonMode.nonLayoutOnly}) {
  if (expectedHtml.trim().isEmpty) {
    // Pictures are rendered lazily. If there's no content in the canvas, we
    // do not create any elements.
    expectCurrentHtml('', mode: mode);
  } else {
    expectCurrentHtml('<pic><c>${expectedHtml}</c></pic>', mode: mode);
  }
}

/// Tests the [currentHtml] against [expectedHtml] considering only the
/// properties pertaining to the layout, such as CSS transforms.
void expectCurrentLayout(String expectedHtml) {
  expectCurrentHtml(expectedHtml, mode: HtmlComparisonMode.layoutOnly);
}

/// Currently rendered HTML DOM as an HTML string.
String get currentHtml {
  return ui.domRenderer.sceneElement?.outerHtml ?? '';
}

/// A widget that creates an element and sizes itself by constraining its
/// [width] and [height] to the incoming parent constraints.
///
/// Useful for testing various layout widgets because the output can be verified
/// in the resulting HTML ([SizedBox] can't be used in this manner because it
/// does not create HTML elements).
class TestSizedBoxWithElement extends LeafRenderObjectWidget {
  TestSizedBoxWithElement.expand() : this.isExpand = true;
  TestSizedBoxWithElement.shrink() : this.isExpand = false;

  final bool isExpand;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderTestSizedBoxWithElement(this);
}

class _RenderTestSizedBoxWithElement extends RenderBox
    with RenderObjectWithChildMixin {
  _RenderTestSizedBoxWithElement(this.widget);

  final TestSizedBoxWithElement widget;

  @override
  void performLayout() {
    if (widget.isExpand) {
      size = constraints.biggest;
    } else {
      size = constraints.smallest;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.pushClipRect(true, offset, Offset.zero & size, (_, __) {});
  }
}

/// A [TickerProvider] that creates a standalone ticker.
///
/// Useful in tests that create an [AnimationController] outside of the widget
/// tree.
class TestVSync implements TickerProvider {
  /// Creates a ticker provider that creates standalone tickers.
  const TestVSync();

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
