// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

/// Applies a Zefyr editor theme to descendant widgets.
///
/// Describes colors and typographic styles for an editor.
///
/// Descendant widgets obtain the current theme's [ZefyrThemeData] object using
/// [ZefyrTheme.of].
///
/// See also:
///
///   * [ZefyrThemeData], which describes actual configuration of a theme.
class ZefyrTheme extends InheritedWidget {
  final ZefyrThemeData data;

  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  ZefyrTheme({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(data != null),
        assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(ZefyrTheme oldWidget) {
    return data != oldWidget.data;
  }

  /// The data from the closest [ZefyrTheme] instance that encloses the given
  /// context.
  ///
  /// Returns `null` if there is no [ZefyrTheme] in the given build context
  /// and [nullOk] is set to `true`. If [nullOk] is set to `false` (default)
  /// then this method asserts.
  static ZefyrThemeData of(BuildContext context, {bool nullOk: false}) {
    final ZefyrTheme widget = context.inheritFromWidgetOfExactType(ZefyrTheme);
    if (widget == null && nullOk) return null;
    assert(widget != null,
        '$ZefyrTheme.of() called with a context that does not contain a ZefyrEditor.');
    return widget.data;
  }
}

/// Holds colors and typography styles for [ZefyrEditor].
class ZefyrThemeData {
  final TextStyle boldStyle;
  final TextStyle italicStyle;
  final TextStyle linkStyle;
  final StyleTheme paragraphTheme;
  final HeadingTheme headingTheme;
  final BlockTheme blockTheme;
  final Color selectionColor;
  final Color cursorColor;

  /// Size of indentation for blocks.
  final double indentSize;
  final ZefyrToolbarTheme toolbarTheme;

  factory ZefyrThemeData.fallback(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context);
    final paragraphStyle = defaultStyle.style.copyWith(
      fontSize: 16.0,
      height: 1.25,
      fontWeight: FontWeight.normal,
      color: Colors.grey.shade800,
    );
    final padding = const EdgeInsets.only(bottom: 16.0);
    final boldStyle = new TextStyle(fontWeight: FontWeight.bold);
    final italicStyle = new TextStyle(fontStyle: FontStyle.italic);
    final linkStyle =
        TextStyle(color: Colors.blue, decoration: TextDecoration.underline);

    return new ZefyrThemeData(
      boldStyle: boldStyle,
      italicStyle: italicStyle,
      linkStyle: linkStyle,
      paragraphTheme:
          new StyleTheme(textStyle: paragraphStyle, padding: padding),
      headingTheme: new HeadingTheme.fallback(),
      blockTheme: new BlockTheme.fallback(),
      selectionColor: Colors.lightBlueAccent.shade100,
      cursorColor: Colors.black,
      indentSize: 16.0,
      toolbarTheme: new ZefyrToolbarTheme.fallback(context),
    );
  }

  const ZefyrThemeData({
    this.boldStyle,
    this.italicStyle,
    this.linkStyle,
    this.paragraphTheme,
    this.headingTheme,
    this.blockTheme,
    this.selectionColor,
    this.cursorColor,
    this.indentSize,
    this.toolbarTheme,
  });

  ZefyrThemeData copyWith({
    TextStyle textStyle,
    TextStyle boldStyle,
    TextStyle italicStyle,
    TextStyle linkStyle,
    StyleTheme paragraphTheme,
    HeadingTheme headingTheme,
    BlockTheme blockTheme,
    Color selectionColor,
    Color cursorColor,
    double indentSize,
    ZefyrToolbarTheme toolbarTheme,
  }) {
    return new ZefyrThemeData(
      boldStyle: boldStyle ?? this.boldStyle,
      italicStyle: italicStyle ?? this.italicStyle,
      linkStyle: linkStyle ?? this.linkStyle,
      paragraphTheme: paragraphTheme ?? this.paragraphTheme,
      headingTheme: headingTheme ?? this.headingTheme,
      blockTheme: blockTheme ?? this.blockTheme,
      selectionColor: selectionColor ?? this.selectionColor,
      cursorColor: cursorColor ?? this.cursorColor,
      indentSize: indentSize ?? this.indentSize,
      toolbarTheme: toolbarTheme ?? this.toolbarTheme,
    );
  }

  ZefyrThemeData merge(ZefyrThemeData other) {
    return copyWith(
      boldStyle: other.boldStyle,
      italicStyle: other.italicStyle,
      linkStyle: other.linkStyle,
      paragraphTheme: other.paragraphTheme,
      headingTheme: other.headingTheme,
      blockTheme: other.blockTheme,
      selectionColor: other.selectionColor,
      cursorColor: other.cursorColor,
      indentSize: other.indentSize,
      toolbarTheme: other.toolbarTheme,
    );
  }
}

/// Theme for heading-styled lines of text.
class HeadingTheme {
  /// Style theme for level 1 headings.
  final StyleTheme level1;

  /// Style theme for level 2 headings.
  final StyleTheme level2;

  /// Style theme for level 3 headings.
  final StyleTheme level3;

  HeadingTheme({
    @required this.level1,
    @required this.level2,
    @required this.level3,
  });

  /// Creates fallback theme for headings.
  factory HeadingTheme.fallback() {
    return HeadingTheme(
      level1: StyleTheme(
        textStyle: TextStyle(
          fontSize: 30.0,
          color: Colors.grey.shade800,
          height: 1.25,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
      ),
      level2: StyleTheme(
        textStyle: TextStyle(
          fontSize: 24.0,
          color: Colors.grey.shade800,
          height: 1.25,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
      ),
      level3: StyleTheme(
        textStyle: TextStyle(
          fontSize: 20.0,
          color: Colors.grey.shade800,
          height: 1.25,
          fontWeight: FontWeight.w600,
        ),
        padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
      ),
    );
  }
}

/// Theme for a block of lines in a document.
class BlockTheme {
  /// Style theme for bullet lists.
  final StyleTheme bulletList;

  /// Style theme for number lists.
  final StyleTheme numberList;

  /// Style theme for code snippets.
  final StyleTheme code;

  /// Style theme for quotes.
  final StyleTheme quote;

  BlockTheme({
    @required this.bulletList,
    @required this.numberList,
    @required this.quote,
    @required this.code,
  });

  /// Creates fallback theme for blocks.
  factory BlockTheme.fallback() {
    final padding = const EdgeInsets.only(bottom: 8.0);
    return new BlockTheme(
      bulletList: new StyleTheme(padding: padding),
      numberList: new StyleTheme(padding: padding),
      quote: new StyleTheme(
        textStyle: new TextStyle(color: Colors.grey.shade700),
        padding: padding,
      ),
      code: new StyleTheme(
        textStyle: new TextStyle(
          color: Colors.blueGrey.shade800,
          fontFamily: Platform.isIOS ? 'Menlo' : 'Roboto Mono',
          fontSize: 14.0,
          height: 1.25,
        ),
        padding: padding,
      ),
    );
  }
}

/// Theme for a specific attribute style.
///
/// Used in [HeadingTheme] and [BlockTheme], as well as in
/// [ZefyrThemeData.paragraphTheme].
class StyleTheme {
  /// Text style of this theme.
  final TextStyle textStyle;

  /// Padding to apply around lines of text.
  final EdgeInsets padding;

  /// Creates a new [StyleTheme].
  StyleTheme({
    this.textStyle,
    this.padding,
  });
}

/// Defines styles and colors for [ZefyrToolbar].
class ZefyrToolbarTheme {
  /// The background color of toolbar.
  final Color color;

  /// Color of buttons in toggled state.
  final Color toggleColor;

  /// Color of button icons.
  final Color iconColor;

  /// Color of button icons in disabled state.
  final Color disabledIconColor;

  /// Creates fallback theme for editor toolbars.
  factory ZefyrToolbarTheme.fallback(BuildContext context) {
    final theme = Theme.of(context);
    return ZefyrToolbarTheme._(
      color: theme.primaryColorLight,
      toggleColor: theme.primaryColor,
      iconColor: theme.primaryIconTheme.color,
      disabledIconColor: theme.primaryColor,
    );
  }

  ZefyrToolbarTheme._({
    @required this.color,
    @required this.toggleColor,
    @required this.iconColor,
    @required this.disabledIconColor,
  });

  ZefyrToolbarTheme copyWith({
    Color color,
    Color toggleColor,
    Color iconColor,
    Color disabledIconColor,
  }) {
    return ZefyrToolbarTheme._(
      color: color ?? this.color,
      toggleColor: toggleColor ?? this.toggleColor,
      iconColor: iconColor ?? this.iconColor,
      disabledIconColor: disabledIconColor ?? this.disabledIconColor,
    );
  }
}
