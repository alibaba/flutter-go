// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:charcode/charcode.dart';

import 'ast.dart';
import 'document.dart';
import 'emojis.dart';
import 'util.dart';

/// Maintains the internal state needed to parse inline span elements in
/// Markdown.
class InlineParser {
  static final List<InlineSyntax> _defaultSyntaxes =
      List<InlineSyntax>.unmodifiable(<InlineSyntax>[
    EmailAutolinkSyntax(),
    AutolinkSyntax(),
    LineBreakSyntax(),
    LinkSyntax(),
    ImageSyntax(),
    // Allow any punctuation to be escaped.
    EscapeSyntax(),
    // "*" surrounded by spaces is left alone.
    TextSyntax(r' \* '),
    // "_" surrounded by spaces is left alone.
    TextSyntax(r' _ '),
    // Parse "**strong**" and "*emphasis*" tags.
    TagSyntax(r'\*+', requiresDelimiterRun: true),
    // Parse "__strong__" and "_emphasis_" tags.
    TagSyntax(r'_+', requiresDelimiterRun: true),
    CodeSyntax(),
    // We will add the LinkSyntax once we know about the specific link resolver.
  ]);

  static final List<InlineSyntax> _htmlSyntaxes =
      List<InlineSyntax>.unmodifiable(<InlineSyntax>[
    // Leave already-encoded HTML entities alone. Ensures we don't turn
    // "&amp;" into "&amp;amp;"
    TextSyntax(r'&[#a-zA-Z0-9]*;'),
    // Encode "&".
    TextSyntax(r'&', sub: '&amp;'),
    // Encode "<". (Why not encode ">" too? Gruber is toying with us.)
    TextSyntax(r'<', sub: '&lt;'),
    // We will add the LinkSyntax once we know about the specific link resolver.
  ]);

  /// The string of Markdown being parsed.
  final String source;

  /// The Markdown document this parser is parsing.
  final Document document;

  final List<InlineSyntax> syntaxes = <InlineSyntax>[];

  /// The current read position.
  int pos = 0;

  /// Starting position of the last unconsumed text.
  int start = 0;

  final List<TagState> _stack;

  InlineParser(this.source, this.document) : _stack = <TagState>[] {
    // User specified syntaxes are the first syntaxes to be evaluated.
    syntaxes.addAll(document.inlineSyntaxes);

    var documentHasCustomInlineSyntaxes = document.inlineSyntaxes
        .any((s) => !document.extensionSet.inlineSyntaxes.contains(s));

    // This first RegExp matches plain text to accelerate parsing. It's written
    // so that it does not match any prefix of any following syntaxes. Most
    // Markdown is plain text, so it's faster to match one RegExp per 'word'
    // rather than fail to match all the following RegExps at each non-syntax
    // character position.
    if (documentHasCustomInlineSyntaxes) {
      // We should be less aggressive in blowing past "words".
      syntaxes.add(TextSyntax(r'[A-Za-z0-9]+(?=\s)'));
    } else {
      syntaxes.add(TextSyntax(r'[ \tA-Za-z0-9]*[A-Za-z0-9](?=\s)'));
    }

    syntaxes.addAll(_defaultSyntaxes);

    if (this.document.encodeHtml) {
      syntaxes.addAll(_htmlSyntaxes);
    }

    // Custom link resolvers go after the generic text syntax.
    syntaxes.insertAll(1, [
      LinkSyntax(linkResolver: document.linkResolver),
      ImageSyntax(linkResolver: document.imageLinkResolver)
    ]);
  }

  List<Node> parse() {
    // Make a fake top tag to hold the results.
    _stack.add(TagState(0, 0, null, null));

    while (!isDone) {
      // See if any of the current tags on the stack match.  This takes
      // priority over other possible matches.
      if (_stack.reversed
          .any((state) => state.syntax != null && state.tryMatch(this)))
        continue;

      // See if the current text matches any defined markdown syntax.
      if (syntaxes.any((syntax) => syntax.tryMatch(this))) continue;

      // If we got here, it's just text.
      advanceBy(1);
    }

    // Unwind any unmatched tags and get the results.
    return _stack[0].close(this, null);
  }

  int charAt(int index) => source.codeUnitAt(index);

  void writeText() {
    writeTextRange(start, pos);
    start = pos;
  }

  void writeTextRange(int start, int end) {
    if (end <= start) return;

    var text = source.substring(start, end);
    var nodes = _stack.last.children;

    // If the previous node is text too, just append.
    if (nodes.isNotEmpty && nodes.last is Text) {
      var textNode = nodes.last as Text;
      nodes[nodes.length - 1] = Text('${textNode.text}$text');
    } else {
      nodes.add(Text(text));
    }
  }

  /// Add [node] to the last [TagState] on the stack.
  void addNode(Node node) {
    _stack.last.children.add(node);
  }

  /// Push [state] onto the stack of [TagState]s.
  void openTag(TagState state) => _stack.add(state);

  bool get isDone => pos == source.length;

  void advanceBy(int length) {
    pos += length;
  }

  void consume(int length) {
    pos += length;
    start = pos;
  }
}

/// Represents one kind of Markdown tag that can be parsed.
abstract class InlineSyntax {
  final RegExp pattern;

  InlineSyntax(String pattern) : pattern = RegExp(pattern, multiLine: true);

  /// Tries to match at the parser's current position.
  ///
  /// The parser's position can be overriden with [startMatchPos].
  /// Returns whether or not the pattern successfully matched.
  bool tryMatch(InlineParser parser, [int startMatchPos]) {
    if (startMatchPos == null) startMatchPos = parser.pos;

    final startMatch = pattern.matchAsPrefix(parser.source, startMatchPos);
    if (startMatch == null) return false;

    // Write any existing plain text up to this point.
    parser.writeText();

    if (onMatch(parser, startMatch)) parser.consume(startMatch[0].length);
    return true;
  }

  /// Processes [match], adding nodes to [parser] and possibly advancing
  /// [parser].
  ///
  /// Returns whether the caller should advance [parser] by `match[0].length`.
  bool onMatch(InlineParser parser, Match match);
}

/// Represents a hard line break.
class LineBreakSyntax extends InlineSyntax {
  LineBreakSyntax() : super(r'(?:\\|  +)\n');

  /// Create a void <br> element.
  bool onMatch(InlineParser parser, Match match) {
    parser.addNode(Element.empty('br'));
    return true;
  }
}

/// Matches stuff that should just be passed through as straight text.
class TextSyntax extends InlineSyntax {
  final String substitute;

  TextSyntax(String pattern, {String sub})
      : substitute = sub,
        super(pattern);

  bool onMatch(InlineParser parser, Match match) {
    if (substitute == null) {
      // Just use the original matched text.
      parser.advanceBy(match[0].length);
      return false;
    }

    // Insert the substitution.
    parser.addNode(Text(substitute));
    return true;
  }
}

/// Escape punctuation preceded by a backslash.
class EscapeSyntax extends InlineSyntax {
  EscapeSyntax() : super(r'''\\[!"#$%&'()*+,\-./:;<=>?@\[\\\]^_`{|}~]''');

  bool onMatch(InlineParser parser, Match match) {
    // Insert the substitution.
    parser.addNode(Text(match[0][1]));
    return true;
  }
}

/// Leave inline HTML tags alone, from
/// [CommonMark 0.28](http://spec.commonmark.org/0.28/#raw-html).
///
/// This is not actually a good definition (nor CommonMark's) of an HTML tag,
/// but it is fast. It will leave text like `<a href='hi">` alone, which is
/// incorrect.
///
/// TODO(srawlins): improve accuracy while ensuring performance, once
/// Markdown benchmarking is more mature.
class InlineHtmlSyntax extends TextSyntax {
  InlineHtmlSyntax() : super(r'<[/!?]?[A-Za-z][A-Za-z0-9-]*(?:\s[^>]*)?>');
}

/// Matches autolinks like `<foo@bar.example.com>`.
///
/// See <http://spec.commonmark.org/0.28/#email-address>.
class EmailAutolinkSyntax extends InlineSyntax {
  static final _email =
      r'''[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}'''
      r'''[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*''';

  EmailAutolinkSyntax() : super('<($_email)>');

  bool onMatch(InlineParser parser, Match match) {
    var url = match[1];
    var anchor = Element.text('a', escapeHtml(url));
    anchor.attributes['href'] = Uri.encodeFull('mailto:$url');
    parser.addNode(anchor);

    return true;
  }
}

/// Matches autolinks like `<http://foo.com>`.
class AutolinkSyntax extends InlineSyntax {
  AutolinkSyntax() : super(r'<(([a-zA-Z][a-zA-Z\-\+\.]+):(?://)?[^\s>]*)>');

  bool onMatch(InlineParser parser, Match match) {
    var url = match[1];
    var anchor = Element.text('a', escapeHtml(url));
    anchor.attributes['href'] = Uri.encodeFull(url);
    parser.addNode(anchor);

    return true;
  }
}

/// Matches autolinks like `http://foo.com`.
class AutolinkExtensionSyntax extends InlineSyntax {
  /// Broken up parts of the autolink regex for reusability and readability

  // Autolinks can only come at the beginning of a line, after whitespace, or
  // any of the delimiting characters *, _, ~, and (.
  static const start = r'(?:^|[\s*_~(>])';
  // An extended url autolink will be recognized when one of the schemes
  // http://, https://, or ftp://, followed by a valid domain
  static const scheme = r'(?:(?:https?|ftp):\/\/|www\.)';
  // A valid domain consists of alphanumeric characters, underscores (_),
  // hyphens (-) and periods (.). There must be at least one period, and no
  // underscores may be present in the last two segments of the domain.
  static const domainPart = r'\w\-';
  static const domain = '[$domainPart][$domainPart.]+';
  // A valid domain consists of alphanumeric characters, underscores (_),
  // hyphens (-) and periods (.).
  static const path = r'[^\s<]*';
  // Trailing punctuation (specifically, ?, !, ., ,, :, *, _, and ~) will not
  // be considered part of the autolink
  static const truncatingPunctuationPositive = r'[?!.,:*_~]';

  static final regExpTrailingPunc =
      RegExp('$truncatingPunctuationPositive*' + r'$');
  static final regExpEndsWithColon = RegExp(r'\&[a-zA-Z0-9]+;$');
  static final regExpWhiteSpace = RegExp(r'\s');

  AutolinkExtensionSyntax() : super('$start(($scheme)($domain)($path))');

  @override
  bool tryMatch(InlineParser parser, [int startMatchPos]) {
    return super.tryMatch(parser, parser.pos > 0 ? parser.pos - 1 : 0);
  }

  @override
  bool onMatch(InlineParser parser, Match match) {
    var url = match[1];
    var href = url;
    var matchLength = url.length;

    if (url[0] == '>' || url.startsWith(regExpWhiteSpace)) {
      url = url.substring(1, url.length - 1);
      href = href.substring(1, href.length - 1);
      parser.pos++;
      matchLength--;
    }

    // Prevent accidental standard autolink matches
    if (url.endsWith('>') && parser.source[parser.pos - 1] == '<') {
      return false;
    }

    // When an autolink ends in ), we scan the entire autolink for the total
    // number of parentheses. If there is a greater number of closing
    // parentheses than opening ones, we don’t consider the last character
    // part of the autolink, in order to facilitate including an autolink
    // inside a parenthesis:
    // https://github.github.com/gfm/#example-600
    if (url.endsWith(')')) {
      final opening = _countChars(url, '(');
      final closing = _countChars(url, ')');

      if (closing > opening) {
        url = url.substring(0, url.length - 1);
        href = href.substring(0, href.length - 1);
        matchLength--;
      }
    }

    // Trailing punctuation (specifically, ?, !, ., ,, :, *, _, and ~) will
    // not be considered part of the autolink, though they may be included
    // in the interior of the link:
    // https://github.github.com/gfm/#example-599
    final trailingPunc = regExpTrailingPunc.firstMatch(url);
    if (trailingPunc != null) {
      url = url.substring(0, url.length - trailingPunc[0].length);
      href = href.substring(0, href.length - trailingPunc[0].length);
      matchLength -= trailingPunc[0].length;
    }

    // If an autolink ends in a semicolon (;), we check to see if it appears
    // to resemble an
    // [entity reference](https://github.github.com/gfm/#entity-references);
    // if the preceding text is & followed by one or more alphanumeric
    // characters. If so, it is excluded from the autolink:
    // https://github.github.com/gfm/#example-602
    if (url.endsWith(';')) {
      final entityRef = regExpEndsWithColon.firstMatch(url);
      if (entityRef != null) {
        // Strip out HTML entity reference
        url = url.substring(0, url.length - entityRef[0].length);
        href = href.substring(0, href.length - entityRef[0].length);
        matchLength -= entityRef[0].length;
      }
    }

    // The scheme http will be inserted automatically
    if (!href.startsWith('http://') &&
        !href.startsWith('https://') &&
        !href.startsWith('ftp://')) {
      href = 'http://$href';
    }

    final anchor = Element.text('a', escapeHtml(url));
    anchor.attributes['href'] = Uri.encodeFull(href);
    parser.addNode(anchor);

    parser.consume(matchLength);
    return false;
  }

  int _countChars(String input, String char) {
    var count = 0;

    for (var i = 0; i < input.length; i++) {
      if (input[i] == char) count++;
    }

    return count;
  }
}

class _DelimiterRun {
  static final String punctuation = r'''!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~''';
  // TODO(srawlins): Unicode whitespace
  static final String whitespace = ' \t\r\n';

  final int char;
  final int length;
  final bool isLeftFlanking;
  final bool isRightFlanking;
  final bool isPrecededByPunctuation;
  final bool isFollowedByPunctuation;

  _DelimiterRun._(
      {this.char,
      this.length,
      this.isLeftFlanking,
      this.isRightFlanking,
      this.isPrecededByPunctuation,
      this.isFollowedByPunctuation});

  static _DelimiterRun tryParse(InlineParser parser, int runStart, int runEnd) {
    bool leftFlanking,
        rightFlanking,
        precededByPunctuation,
        followedByPunctuation;
    String preceding, following;
    if (runStart == 0) {
      rightFlanking = false;
      preceding = '\n';
    } else {
      preceding = parser.source.substring(runStart - 1, runStart);
    }
    precededByPunctuation = punctuation.contains(preceding);

    if (runEnd == parser.source.length - 1) {
      leftFlanking = false;
      following = '\n';
    } else {
      following = parser.source.substring(runEnd + 1, runEnd + 2);
    }
    followedByPunctuation = punctuation.contains(following);

    // http://spec.commonmark.org/0.28/#left-flanking-delimiter-run
    if (whitespace.contains(following)) {
      leftFlanking = false;
    } else {
      leftFlanking = !followedByPunctuation ||
          whitespace.contains(preceding) ||
          precededByPunctuation;
    }

    // http://spec.commonmark.org/0.28/#right-flanking-delimiter-run
    if (whitespace.contains(preceding)) {
      rightFlanking = false;
    } else {
      rightFlanking = !precededByPunctuation ||
          whitespace.contains(following) ||
          followedByPunctuation;
    }

    if (!leftFlanking && !rightFlanking) {
      // Could not parse a delimiter run.
      return null;
    }

    return _DelimiterRun._(
        char: parser.charAt(runStart),
        length: runEnd - runStart + 1,
        isLeftFlanking: leftFlanking,
        isRightFlanking: rightFlanking,
        isPrecededByPunctuation: precededByPunctuation,
        isFollowedByPunctuation: followedByPunctuation);
  }

  String toString() =>
      '<char: $char, length: $length, isLeftFlanking: $isLeftFlanking, '
      'isRightFlanking: $isRightFlanking>';

  // Whether a delimiter in this run can open emphasis or strong emphasis.
  bool get canOpen =>
      isLeftFlanking &&
      (char == $asterisk || !isRightFlanking || isPrecededByPunctuation);

  // Whether a delimiter in this run can close emphasis or strong emphasis.
  bool get canClose =>
      isRightFlanking &&
      (char == $asterisk || !isLeftFlanking || isFollowedByPunctuation);
}

/// Matches syntax that has a pair of tags and becomes an element, like `*` for
/// `<em>`. Allows nested tags.
class TagSyntax extends InlineSyntax {
  final RegExp endPattern;

  /// Whether this is parsed according to the same nesting rules as [emphasis
  /// delimiters][].
  ///
  /// [emphasis delimiters]: http://spec.commonmark.org/0.28/#can-open-emphasis
  final bool requiresDelimiterRun;

  TagSyntax(String pattern, {String end, this.requiresDelimiterRun = false})
      : endPattern = RegExp((end != null) ? end : pattern, multiLine: true),
        super(pattern);

  bool onMatch(InlineParser parser, Match match) {
    var runLength = match.group(0).length;
    var matchStart = parser.pos;
    var matchEnd = parser.pos + runLength - 1;
    if (!requiresDelimiterRun) {
      parser.openTag(TagState(parser.pos, matchEnd + 1, this, null));
      return true;
    }

    var delimiterRun = _DelimiterRun.tryParse(parser, matchStart, matchEnd);
    if (delimiterRun != null && delimiterRun.canOpen) {
      parser.openTag(TagState(parser.pos, matchEnd + 1, this, delimiterRun));
      return true;
    } else {
      parser.advanceBy(runLength);
      return false;
    }
  }

  bool onMatchEnd(InlineParser parser, Match match, TagState state) {
    var runLength = match.group(0).length;
    var matchStart = parser.pos;
    var matchEnd = parser.pos + runLength - 1;
    var openingRunLength = state.endPos - state.startPos;
    var delimiterRun = _DelimiterRun.tryParse(parser, matchStart, matchEnd);

    if (openingRunLength == 1 && runLength == 1) {
      parser.addNode(Element('em', state.children));
    } else if (openingRunLength == 1 && runLength > 1) {
      parser.addNode(Element('em', state.children));
      parser.pos = parser.pos - (runLength - 1);
      parser.start = parser.pos;
    } else if (openingRunLength > 1 && runLength == 1) {
      parser.openTag(
          TagState(state.startPos, state.endPos - 1, this, delimiterRun));
      parser.addNode(Element('em', state.children));
    } else if (openingRunLength == 2 && runLength == 2) {
      parser.addNode(Element('strong', state.children));
    } else if (openingRunLength == 2 && runLength > 2) {
      parser.addNode(Element('strong', state.children));
      parser.pos = parser.pos - (runLength - 2);
      parser.start = parser.pos;
    } else if (openingRunLength > 2 && runLength == 2) {
      parser.openTag(
          TagState(state.startPos, state.endPos - 2, this, delimiterRun));
      parser.addNode(Element('strong', state.children));
    } else if (openingRunLength > 2 && runLength > 2) {
      parser.openTag(
          TagState(state.startPos, state.endPos - 2, this, delimiterRun));
      parser.addNode(Element('strong', state.children));
      parser.pos = parser.pos - (runLength - 2);
      parser.start = parser.pos;
    }

    return true;
  }
}

/// Matches strikethrough syntax according to the GFM spec.
class StrikethroughSyntax extends TagSyntax {
  StrikethroughSyntax() : super('~+', requiresDelimiterRun: true);

  @override
  bool onMatchEnd(InlineParser parser, Match match, TagState state) {
    var runLength = match.group(0).length;
    var matchStart = parser.pos;
    var matchEnd = parser.pos + runLength - 1;
    var delimiterRun = _DelimiterRun.tryParse(parser, matchStart, matchEnd);
    if (!delimiterRun.isRightFlanking) {
      return false;
    }

    parser.addNode(Element('del', state.children));
    return true;
  }
}

/// Matches links like `[blah][label]` and `[blah](url)`.
class LinkSyntax extends TagSyntax {
  static final _entirelyWhitespacePattern = RegExp(r'^\s*$');

  final Resolver linkResolver;

  LinkSyntax({Resolver linkResolver, String pattern = r'\['})
      : this.linkResolver = (linkResolver ?? (String _, [String __]) => null),
        super(pattern, end: r'\]');

  // The pending [TagState]s, all together, are "active" or "inactive" based on
  // whether a link element has just been parsed.
  //
  // Links cannot be nested, so we must "deactivate" any pending ones. For
  // example, take the following text:
  //
  //     Text [link and [more](links)](links).
  //
  // Once we have parsed `Text [`, there is one (pending) link in the state
  // stack.  It is, by default, active. Once we parse the next possible link,
  // `[more](links)`, as a real link, we must deactive the pending links (just
  // the one, in this case).
  var _pendingStatesAreActive = true;

  bool onMatch(InlineParser parser, Match match) {
    var matched = super.onMatch(parser, match);
    if (!matched) return false;

    _pendingStatesAreActive = true;

    return true;
  }

  bool onMatchEnd(InlineParser parser, Match match, TagState state) {
    if (!_pendingStatesAreActive) return false;

    var text = parser.source.substring(state.endPos, parser.pos);
    // The current character is the `]` that closed the link text. Examine the
    // next character, to determine what type of link we might have (a '('
    // means a possible inline link; otherwise a possible reference link).
    if (parser.pos + 1 >= parser.source.length) {
      // In this case, the Markdown document may have ended with a shortcut
      // reference link.

      return _tryAddReferenceLink(parser, state, text);
    }
    // Peek at the next character; don't advance, so as to avoid later stepping
    // backward.
    var char = parser.charAt(parser.pos + 1);

    if (char == $lparen) {
      // Maybe an inline link, like `[text](destination)`.
      parser.advanceBy(1);
      var leftParenIndex = parser.pos;
      var inlineLink = _parseInlineLink(parser);
      if (inlineLink != null)
        return _tryAddInlineLink(parser, state, inlineLink);

      // Reset the parser position.
      parser.pos = leftParenIndex;

      // At this point, we've matched `[...](`, but that `(` did not pan out to
      // be an inline link. We must now check if `[...]` is simply a shortcut
      // reference link.
      parser.advanceBy(-1);
      return _tryAddReferenceLink(parser, state, text);
    }

    if (char == $lbracket) {
      parser.advanceBy(1);
      // At this point, we've matched `[...][`. Maybe a *full* reference link,
      // like `[foo][bar]` or a *collapsed* reference link, like `[foo][]`.
      if (parser.pos + 1 < parser.source.length &&
          parser.charAt(parser.pos + 1) == $rbracket) {
        // That opening `[` is not actually part of the link. Maybe a
        // *shortcut* reference link (followed by a `[`).
        parser.advanceBy(1);
        return _tryAddReferenceLink(parser, state, text);
      }
      var label = _parseReferenceLinkLabel(parser);
      if (label != null) return _tryAddReferenceLink(parser, state, label);
      return false;
    }

    // The link text (inside `[...]`) was not followed with a opening `(` nor
    // an opening `[`. Perhaps just a simple shortcut reference link (`[...]`).

    return _tryAddReferenceLink(parser, state, text);
  }

  /// Resolve a possible reference link.
  ///
  /// Uses [linkReferences], [linkResolver], and [_createNode] to try to
  /// resolve [label] and [state] into a [Node]. If [label] is defined in
  /// [linkReferences] or can be resolved by [linkResolver], returns a [Node]
  /// that links to the resolved URL.
  ///
  /// Otherwise, returns `null`.
  ///
  /// [label] does not need to be normalized.
  Node _resolveReferenceLink(
      String label, TagState state, Map<String, LinkReference> linkReferences) {
    var normalizedLabel = label.toLowerCase();
    var linkReference = linkReferences[normalizedLabel];
    if (linkReference != null) {
      return _createNode(state, linkReference.destination, linkReference.title);
    } else {
      // This link has no reference definition. But we allow users of the
      // library to specify a custom resolver function ([linkResolver]) that
      // may choose to handle this. Otherwise, it's just treated as plain
      // text.

      // Normally, label text does not get parsed as inline Markdown. However,
      // for the benefit of the link resolver, we need to at least escape
      // brackets, so that, e.g. a link resolver can receive `[\[\]]` as `[]`.
      return linkResolver(label
          .replaceAll(r'\\', r'\')
          .replaceAll(r'\[', '[')
          .replaceAll(r'\]', ']'));
    }
  }

  /// Create the node represented by a Markdown link.
  Node _createNode(TagState state, String destination, String title) {
    var element = Element('a', state.children);
    element.attributes['href'] = escapeAttribute(destination);
    if (title != null && title.isNotEmpty) {
      element.attributes['title'] = escapeAttribute(title);
    }
    return element;
  }

  // Add a reference link node to [parser]'s AST.
  //
  // Returns whether the link was added successfully.
  bool _tryAddReferenceLink(InlineParser parser, TagState state, String label) {
    var element =
        _resolveReferenceLink(label, state, parser.document.linkReferences);
    if (element == null) {
      return false;
    }
    parser.addNode(element);
    parser.start = parser.pos;
    _pendingStatesAreActive = false;
    return true;
  }

  // Add an inline link node to [parser]'s AST.
  //
  // Returns whether the link was added successfully.
  bool _tryAddInlineLink(InlineParser parser, TagState state, InlineLink link) {
    var element = _createNode(state, link.destination, link.title);
    if (element == null) return false;
    parser.addNode(element);
    parser.start = parser.pos;
    _pendingStatesAreActive = false;
    return true;
  }

  /// Parse a reference link label at the current position.
  ///
  /// Specifically, [parser.pos] is expected to be pointing at the `[` which
  /// opens the link label.
  ///
  /// Returns the label if it could be parsed, or `null` if not.
  String _parseReferenceLinkLabel(InlineParser parser) {
    // Walk past the opening `[`.
    parser.advanceBy(1);
    if (parser.isDone) return null;

    var buffer = StringBuffer();
    while (true) {
      var char = parser.charAt(parser.pos);
      if (char == $backslash) {
        parser.advanceBy(1);
        var next = parser.charAt(parser.pos);
        if (next != $backslash && next != $rbracket) {
          buffer.writeCharCode(char);
        }
        buffer.writeCharCode(next);
      } else if (char == $rbracket) {
        break;
      } else {
        buffer.writeCharCode(char);
      }
      parser.advanceBy(1);
      if (parser.isDone) return null;
      // TODO(srawlins): only check 999 characters, for performance reasons?
    }

    var label = buffer.toString();

    // A link label must contain at least one non-whitespace character.
    if (_entirelyWhitespacePattern.hasMatch(label)) return null;

    return label;
  }

  /// Parse an inline [InlineLink] at the current position.
  ///
  /// At this point, we have parsed a link's (or image's) opening `[`, and then
  /// a matching closing `]`, and [parser.pos] is pointing at an opening `(`.
  /// This method will then attempt to parse a link destination wrapped in `<>`,
  /// such as `(<http://url>)`, or a bare link destination, such as
  /// `(http://url)`, or a link destination with a title, such as
  /// `(http://url "title")`.
  ///
  /// Returns the [InlineLink] if one was parsed, or `null` if not.
  InlineLink _parseInlineLink(InlineParser parser) {
    // Start walking to the character just after the opening `(`.
    parser.advanceBy(1);

    _moveThroughWhitespace(parser);
    if (parser.isDone) return null; // EOF. Not a link.

    if (parser.charAt(parser.pos) == $lt) {
      // Maybe a `<...>`-enclosed link destination.
      return _parseInlineBracketedLink(parser);
    } else {
      return _parseInlineBareDestinationLink(parser);
    }
  }

  /// Parse an inline link with a bracketed destination (a destination wrapped
  /// in `<...>`). The current position of the parser must be the first
  /// character of the destination.
  InlineLink _parseInlineBracketedLink(InlineParser parser) {
    parser.advanceBy(1);

    var buffer = StringBuffer();
    while (true) {
      var char = parser.charAt(parser.pos);
      if (char == $backslash) {
        parser.advanceBy(1);
        var next = parser.charAt(parser.pos);
        if (char == $space || char == $lf || char == $cr || char == $ff) {
          // Not a link (no whitespace allowed within `<...>`).
          return null;
        }
        // TODO: Follow the backslash spec better here.
        // http://spec.commonmark.org/0.28/#backslash-escapes
        if (next != $backslash && next != $gt) {
          buffer.writeCharCode(char);
        }
        buffer.writeCharCode(next);
      } else if (char == $space || char == $lf || char == $cr || char == $ff) {
        // Not a link (no whitespace allowed within `<...>`).
        return null;
      } else if (char == $gt) {
        break;
      } else {
        buffer.writeCharCode(char);
      }
      parser.advanceBy(1);
      if (parser.isDone) return null;
    }
    var destination = buffer.toString();

    parser.advanceBy(1);
    var char = parser.charAt(parser.pos);
    if (char == $space || char == $lf || char == $cr || char == $ff) {
      var title = _parseTitle(parser);
      if (title == null && parser.charAt(parser.pos) != $rparen) {
        // This looked like an inline link, until we found this $space
        // followed by mystery characters; no longer a link.
        return null;
      }
      return InlineLink(destination, title: title);
    } else if (char == $rparen) {
      return InlineLink(destination);
    } else {
      // We parsed something like `[foo](<url>X`. Not a link.
      return null;
    }
  }

  /// Parse an inline link with a "bare" destination (a destination _not_
  /// wrapped in `<...>`). The current position of the parser must be the first
  /// character of the destination.
  InlineLink _parseInlineBareDestinationLink(InlineParser parser) {
    // According to
    // [CommonMark](http://spec.commonmark.org/0.28/#link-destination):
    //
    // > A link destination consists of [...] a nonempty sequence of
    // > characters [...], and includes parentheses only if (a) they are
    // > backslash-escaped or (b) they are part of a balanced pair of
    // > unescaped parentheses.
    //
    // We need to count the open parens. We start with 1 for the paren that
    // opened the destination.
    var parenCount = 1;
    var buffer = StringBuffer();

    while (true) {
      var char = parser.charAt(parser.pos);
      switch (char) {
        case $backslash:
          parser.advanceBy(1);
          if (parser.isDone) return null; // EOF. Not a link.
          var next = parser.charAt(parser.pos);
          // Parentheses may be escaped.
          //
          // http://spec.commonmark.org/0.28/#example-467
          if (next != $backslash && next != $lparen && next != $rparen) {
            buffer.writeCharCode(char);
          }
          buffer.writeCharCode(next);
          break;

        case $space:
        case $lf:
        case $cr:
        case $ff:
          var destination = buffer.toString();
          var title = _parseTitle(parser);
          if (title == null &&
              (parser.isDone || parser.charAt(parser.pos) != $rparen)) {
            // This looked like an inline link, until we found this $space
            // followed by mystery characters; no longer a link.
            return null;
          }
          // [_parseTitle] made sure the title was follwed by a closing `)`
          // (but it's up to the code here to examine the balance of
          // parentheses).
          parenCount--;
          if (parenCount == 0) {
            return InlineLink(destination, title: title);
          }
          break;

        case $lparen:
          parenCount++;
          buffer.writeCharCode(char);
          break;

        case $rparen:
          parenCount--;
          if (parenCount == 0) {
            var destination = buffer.toString();
            return InlineLink(destination);
          }
          buffer.writeCharCode(char);
          break;

        default:
          buffer.writeCharCode(char);
      }
      parser.advanceBy(1);
      if (parser.isDone) return null; // EOF. Not a link.
    }
  }

  // Walk the parser forward through any whitespace.
  void _moveThroughWhitespace(InlineParser parser) {
    while (!parser.isDone) {
      var char = parser.charAt(parser.pos);
      if (char != $space &&
          char != $tab &&
          char != $lf &&
          char != $vt &&
          char != $cr &&
          char != $ff) {
        return;
      }
      parser.advanceBy(1);
    }
  }

  // Parse a link title in [parser] at it's current position. The parser's
  // current position should be a whitespace character that followed a link
  // destination.
  String _parseTitle(InlineParser parser) {
    _moveThroughWhitespace(parser);
    if (parser.isDone) return null;

    // The whitespace should be followed by a title delimiter.
    var delimiter = parser.charAt(parser.pos);
    if (delimiter != $apostrophe &&
        delimiter != $quote &&
        delimiter != $lparen) {
      return null;
    }

    var closeDelimiter = delimiter == $lparen ? $rparen : delimiter;
    parser.advanceBy(1);

    // Now we look for an un-escaped closing delimiter.
    var buffer = StringBuffer();
    while (true) {
      var char = parser.charAt(parser.pos);
      if (char == $backslash) {
        parser.advanceBy(1);
        var next = parser.charAt(parser.pos);
        if (next != $backslash && next != closeDelimiter) {
          buffer.writeCharCode(char);
        }
        buffer.writeCharCode(next);
      } else if (char == closeDelimiter) {
        break;
      } else {
        buffer.writeCharCode(char);
      }
      parser.advanceBy(1);
      if (parser.isDone) return null;
    }
    var title = buffer.toString();

    // Advance past the closing delimiter.
    parser.advanceBy(1);
    if (parser.isDone) return null;
    _moveThroughWhitespace(parser);
    if (parser.isDone) return null;
    if (parser.charAt(parser.pos) != $rparen) return null;
    return title;
  }
}

/// Matches images like `![alternate text](url "optional title")` and
/// `![alternate text][label]`.
class ImageSyntax extends LinkSyntax {
  ImageSyntax({Resolver linkResolver})
      : super(linkResolver: linkResolver, pattern: r'!\[');

  Node _createNode(TagState state, String destination, String title) {
    var element = Element.empty('img');
    element.attributes['src'] = escapeHtml(destination);
    element.attributes['alt'] = state?.textContent ?? '';
    if (title != null && title.isNotEmpty) {
      element.attributes['title'] =
          escapeAttribute(title.replaceAll('&', '&amp;'));
    }
    return element;
  }

  // Add an image node to [parser]'s AST.
  //
  // If [label] is present, the potential image is treated as a reference image.
  // Otherwise, it is treated as an inline image.
  //
  // Returns whether the image was added successfully.
  bool _tryAddReferenceLink(InlineParser parser, TagState state, String label) {
    var element =
        _resolveReferenceLink(label, state, parser.document.linkReferences);
    if (element == null) {
      return false;
    }
    parser.addNode(element);
    parser.start = parser.pos;
    return true;
  }
}

/// Matches backtick-enclosed inline code blocks.
class CodeSyntax extends InlineSyntax {
  // This pattern matches:
  //
  // * a string of backticks (not followed by any more), followed by
  // * a non-greedy string of anything, including newlines, ending with anything
  //   except a backtick, followed by
  // * a string of backticks the same length as the first, not followed by any
  //   more.
  //
  // This conforms to the delimiters of inline code, both in Markdown.pl, and
  // CommonMark.
  static final String _pattern = r'(`+(?!`))((?:.|\n)*?[^`])\1(?!`)';

  CodeSyntax() : super(_pattern);

  bool tryMatch(InlineParser parser, [int startMatchPos]) {
    if (parser.pos > 0 && parser.charAt(parser.pos - 1) == $backquote) {
      // Not really a match! We can't just sneak past one backtick to try the
      // next character. An example of this situation would be:
      //
      //     before ``` and `` after.
      //             ^--parser.pos
      return false;
    }

    var match = pattern.matchAsPrefix(parser.source, parser.pos);
    if (match == null) {
      return false;
    }
    parser.writeText();
    if (onMatch(parser, match)) parser.consume(match[0].length);
    return true;
  }

  bool onMatch(InlineParser parser, Match match) {
    var code = match[2].trim();
    if (parser.document.encodeHtml) code = escapeHtml(code);
    parser.addNode(Element.text('code', code));

    return true;
  }
}

/// Matches GitHub Markdown emoji syntax like `:smile:`.
///
/// There is no formal specification of GitHub's support for this colon-based
/// emoji support, so this syntax is based on the results of Markdown-enabled
/// text fields at github.com.
class EmojiSyntax extends InlineSyntax {
  // Emoji "aliases" are mostly limited to lower-case letters, numbers, and
  // underscores, but GitHub also supports `:+1:` and `:-1:`.
  EmojiSyntax() : super(':([a-z0-9_+-]+):');

  bool onMatch(InlineParser parser, Match match) {
    var alias = match[1];
    var emoji = emojis[alias];
    if (emoji == null) {
      parser.advanceBy(1);
      return false;
    }
    parser.addNode(Text(emoji));

    return true;
  }
}

/// Keeps track of a currently open tag while it is being parsed.
///
/// The parser maintains a stack of these so it can handle nested tags.
class TagState {
  /// The point in the original source where this tag started.
  final int startPos;

  /// The point in the original source where open tag ended.
  final int endPos;

  /// The syntax that created this node.
  final TagSyntax syntax;

  /// The children of this node. Will be `null` for text nodes.
  final List<Node> children;

  final _DelimiterRun openingDelimiterRun;

  TagState(this.startPos, this.endPos, this.syntax, this.openingDelimiterRun)
      : children = <Node>[];

  /// Attempts to close this tag by matching the current text against its end
  /// pattern.
  bool tryMatch(InlineParser parser) {
    var endMatch = syntax.endPattern.matchAsPrefix(parser.source, parser.pos);
    if (endMatch == null) {
      return false;
    }

    if (!syntax.requiresDelimiterRun) {
      // Close the tag.
      close(parser, endMatch);
      return true;
    }

    // TODO: Move this logic into TagSyntax.
    var runLength = endMatch.group(0).length;
    var openingRunLength = endPos - startPos;
    var closingMatchStart = parser.pos;
    var closingMatchEnd = parser.pos + runLength - 1;
    var closingDelimiterRun =
        _DelimiterRun.tryParse(parser, closingMatchStart, closingMatchEnd);
    if (closingDelimiterRun != null && closingDelimiterRun.canClose) {
      // Emphasis rules #9 and #10:
      var oneRunOpensAndCloses =
          (openingDelimiterRun.canOpen && openingDelimiterRun.canClose) ||
              (closingDelimiterRun.canOpen && closingDelimiterRun.canClose);
      if (oneRunOpensAndCloses &&
          (openingRunLength + closingDelimiterRun.length) % 3 == 0) {
        return false;
      }
      // Close the tag.
      close(parser, endMatch);
      return true;
    } else {
      return false;
    }
  }

  /// Pops this tag off the stack, completes it, and adds it to the output.
  ///
  /// Will discard any unmatched tags that happen to be above it on the stack.
  /// If this is the last node in the stack, returns its children.
  List<Node> close(InlineParser parser, Match endMatch) {
    // If there are unclosed tags on top of this one when it's closed, that
    // means they are mismatched. Mismatched tags are treated as plain text in
    // markdown. So for each tag above this one, we write its start tag as text
    // and then adds its children to this one's children.
    var index = parser._stack.indexOf(this);

    // Remove the unmatched children.
    var unmatchedTags = parser._stack.sublist(index + 1);
    parser._stack.removeRange(index + 1, parser._stack.length);

    // Flatten them out onto this tag.
    for (var unmatched in unmatchedTags) {
      // Write the start tag as text.
      parser.writeTextRange(unmatched.startPos, unmatched.endPos);

      // Bequeath its children unto this tag.
      children.addAll(unmatched.children);
    }

    // Pop this off the stack.
    parser.writeText();
    parser._stack.removeLast();

    // If the stack is empty now, this is the special "results" node.
    if (parser._stack.isEmpty) return children;
    var endMatchIndex = parser.pos;

    // We are still parsing, so add this to its parent's children.
    if (syntax.onMatchEnd(parser, endMatch, this)) {
      parser.consume(endMatch[0].length);
    } else {
      // Didn't close correctly so revert to text.
      parser.writeTextRange(startPos, endPos);
      parser._stack.last.children.addAll(children);
      parser.pos = endMatchIndex;
      parser.advanceBy(endMatch[0].length);
    }

    return null;
  }

  String get textContent =>
      children.map((Node child) => child.textContent).join('');
}

class InlineLink {
  final String destination;
  final String title;

  InlineLink(this.destination, {this.title});
}
