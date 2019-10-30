// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:ui';

import 'package:flutter/material.dart';

/// Helper class responsible for cursor layout and painting.
class CursorPainter {
  static const double _kCaretHeightOffset = 2.0; // pixels
  static const double _kCaretWidth = 1.0; // pixels

  static Rect buildPrototype(double lineHeight) {
    return new Rect.fromLTWH(
        0.0, 0.0, _kCaretWidth, lineHeight - _kCaretHeightOffset);
  }

  CursorPainter(Color color)
      : assert(color != null),
        _color = color;

  Rect _prototype;

  Rect get prototype => _prototype;

  Color _color;
  Color get color => _color;
  set color(Color value) {
    assert(value != null);
    _color = value;
  }

  void layout(double lineHeight) {
    _prototype = buildPrototype(lineHeight);
  }

  void paint(Canvas canvas, Offset offset) {
    final Paint paint = new Paint()..color = _color;
    final Rect caretRect = _prototype.shift(offset);
    canvas.drawRect(caretRect, paint);
  }
}
