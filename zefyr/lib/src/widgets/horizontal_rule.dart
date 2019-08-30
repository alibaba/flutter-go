// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:notus/notus.dart';

import 'editable_box.dart';

class ZefyrHorizontalRule extends LeafRenderObjectWidget {
  ZefyrHorizontalRule({@required this.node}) : assert(node != null);

  final EmbedNode node;

  @override
  RenderHorizontalRule createRenderObject(BuildContext context) {
    return new RenderHorizontalRule(node: node);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderHorizontalRule renderObject) {
    renderObject..node = node;
  }
}

class RenderHorizontalRule extends RenderEditableBox {
  static const _kPaddingBottom = 24.0;
  static const _kThickness = 3.0;
  static const _kHeight = _kThickness + _kPaddingBottom;

  RenderHorizontalRule({
    @required EmbedNode node,
  }) : _node = node;

  @override
  EmbedNode get node => _node;
  EmbedNode _node;
  set node(EmbedNode value) {
    if (_node == value) return;
    _node = value;
    markNeedsPaint();
  }

  @override
  double get preferredLineHeight => size.height;

  @override
  SelectionOrder get selectionOrder => SelectionOrder.background;

  @override
  List<ui.TextBox> getEndpointsForSelection(TextSelection selection) {
    TextSelection local = getLocalSelection(selection);
    if (local.isCollapsed) {
      final dx = local.extentOffset == 0 ? 0.0 : size.width;
      return [
        new ui.TextBox.fromLTRBD(dx, 0.0, dx, size.height, TextDirection.ltr),
      ];
    }

    return [
      new ui.TextBox.fromLTRBD(0.0, 0.0, 0.0, size.height, TextDirection.ltr),
      new ui.TextBox.fromLTRBD(
          size.width, 0.0, size.width, size.height, TextDirection.ltr),
    ];
  }

  @override
  void performLayout() {
    assert(constraints.hasBoundedWidth);
    size = new Size(constraints.maxWidth, _kHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, _kThickness);
    final paint = new ui.Paint()..color = Colors.grey.shade200;
    context.canvas.drawRect(rect.shift(offset), paint);
  }

  @override
  TextPosition getPositionForOffset(Offset offset) {
    int position = _node.documentOffset;

    if (offset.dx > size.width / 2) {
      position++;
    }
    return new TextPosition(offset: position);
  }

  @override
  TextRange getWordBoundary(TextPosition position) {
    final start = _node.documentOffset;
    return new TextRange(start: start, end: start + 1);
  }

  @override
  void paintSelection(PaintingContext context, Offset offset,
      TextSelection selection, Color selectionColor) {
    final localSelection = getLocalSelection(selection);
    assert(localSelection != null);
    if (!localSelection.isCollapsed) {
      final Paint paint = new Paint()..color = selectionColor;
      final rect = new Rect.fromLTWH(0.0, 0.0, size.width, _kHeight);
      context.canvas.drawRect(rect.shift(offset), paint);
    }
  }

  @override
  Offset getOffsetForCaret(ui.TextPosition position, ui.Rect caretPrototype) {
    final pos = position.offset - node.documentOffset;
    Offset caretOffset = Offset.zero;
    if (pos == 1) {
      caretOffset = caretOffset + new Offset(size.width - 1.0, 0.0);
    }
    return caretOffset;
  }
}
