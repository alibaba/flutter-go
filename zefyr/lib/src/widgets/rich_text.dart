// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:notus/notus.dart';

import 'caret.dart';
import 'editable_box.dart';

/// Represents single paragraph of Zefyr rich-text.
class ZefyrRichText extends LeafRenderObjectWidget {
  ZefyrRichText({
    @required this.node,
    @required this.text,
  }) : assert(node != null && text != null);

  final LineNode node;
  final TextSpan text;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return new RenderZefyrParagraph(
      text,
      node: node,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderZefyrParagraph renderObject) {
    renderObject
      ..text = text
      ..node = node;
  }
}

class RenderZefyrParagraph extends RenderParagraph
    implements RenderEditableBox {
  RenderZefyrParagraph(
    TextSpan text, {
    @required LineNode node,
    TextAlign textAlign: TextAlign.start,
    @required TextDirection textDirection,
    bool softWrap: true,
    TextOverflow overflow: TextOverflow.clip,
    double textScaleFactor: 1.0,
    int maxLines,
  })  : _node = node,
        _prototypePainter = new TextPainter(
          text: new TextSpan(text: '.', style: text.style),
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
        ),
        super(
          text,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
        );

  LineNode get node => _node;
  LineNode _node;
  void set node(LineNode value) {
    _node = value;
  }

  @override
  double get preferredLineHeight => _prototypePainter.height;

  @override
  SelectionOrder get selectionOrder => SelectionOrder.background;

  @override
  TextSelection getLocalSelection(TextSelection documentSelection) {
    if (!intersectsWithSelection(documentSelection)) return null;

    int nodeBase = node.documentOffset;
    int nodeExtent = nodeBase + node.length;
    int base = math.max(0, documentSelection.baseOffset - nodeBase);
    int extent =
        math.min(documentSelection.extentOffset, nodeExtent) - nodeBase;
    return documentSelection.copyWith(baseOffset: base, extentOffset: extent);
  }

  @override
  TextPosition getPositionForOffset(Offset offset) {
    final position = super.getPositionForOffset(offset);
    return new TextPosition(
      offset: _node.documentOffset + position.offset,
      affinity: position.affinity,
    );
  }

  @override
  TextRange getWordBoundary(TextPosition position) {
    final localPosition = new TextPosition(
      offset: position.offset - _node.documentOffset,
      affinity: position.affinity,
    );
    final localRange = super.getWordBoundary(localPosition);
    return new TextRange(
      start: _node.documentOffset + localRange.start,
      end: _node.documentOffset + localRange.end,
    );
  }

  @override
  Offset getOffsetForCaret(TextPosition position, Rect caretPrototype) {
    final localPosition = new TextPosition(
      offset: position.offset - _node.documentOffset,
      affinity: position.affinity,
    );
    return super.getOffsetForCaret(localPosition, caretPrototype);
  }

  // This method works around some issues in getBoxesForSelection and handles
  // edge-case with our TextSpan objects not having last line-break character.
  @override
  List<ui.TextBox> getEndpointsForSelection(TextSelection selection) {
    TextSelection local = getLocalSelection(selection);
    if (local.isCollapsed) {
      final caret = CursorPainter.buildPrototype(preferredLineHeight);
      final offset = getOffsetForCaret(local.extent, caret);
      return [
        new ui.TextBox.fromLTRBD(
          offset.dx,
          offset.dy,
          offset.dx,
          offset.dy + caret.height,
          TextDirection.ltr,
        )
      ];
    }

    int isBaseShifted = 0;
    bool isExtentShifted = false;
    if (local.baseOffset == node.length - 1 && local.baseOffset > 0) {
      // Since we exclude last line-break from rendered TextSpan we have to
      // handle end-of-line selection explicitly.
      local = local.copyWith(baseOffset: local.baseOffset - 1);
      isBaseShifted = -1;
    } else if (local.baseOffset == 0 && local.isCollapsed) {
      // This takes care of beginning of line position.
      local = local.copyWith(baseOffset: local.baseOffset + 1);
      isBaseShifted = 1;
    }
    if (text.codeUnitAt(local.extentOffset - 1) == 0xA) {
      // This takes care of the rest end-of-line scenarios, where there are
      // actually line-breaks in the TextSpan (e.g. in code blocks).
      local = local.copyWith(extentOffset: local.extentOffset + 1);
      isExtentShifted = true;
    }
    final result = getBoxesForSelection(local).toList();
    if (isBaseShifted != 0) {
      final box = result.first;
      final dx = isBaseShifted == -1 ? box.right : box.left;
      result.removeAt(0);
      result.insert(0,
          new ui.TextBox.fromLTRBD(dx, box.top, dx, box.bottom, box.direction));
    }
    if (isExtentShifted) {
      final box = result.last;
      result.removeLast;
      result.add(new ui.TextBox.fromLTRBD(
          box.left, box.top, box.left, box.bottom, box.direction));
    }
    return result;
  }

  @override
  void set text(InlineSpan value) {
    _prototypePainter.text = new TextSpan(text: '.', style: value.style);
    _selectionRects = null;
    super.text = value;
  }

  @override
  void performLayout() {
    super.performLayout();
    _prototypePainter.layout(
        minWidth: constraints.minWidth, maxWidth: constraints.maxWidth);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
  }

  final TextPainter _prototypePainter;
  List<ui.TextBox> _selectionRects;

  /// Returns `true` if this paragraph intersects with document [selection].
  @override
  bool intersectsWithSelection(TextSelection selection) {
    final int base = node.documentOffset;
    final int extent = base + node.length;
    return base <= selection.extentOffset && selection.baseOffset <= extent;
  }

  TextSelection _lastPaintedSelection;
  @override
  void paintSelection(PaintingContext context, Offset offset,
      TextSelection selection, Color selectionColor) {
    if (_lastPaintedSelection != selection) {
      _selectionRects = null;
    }
    _selectionRects ??= getBoxesForSelection(getLocalSelection(selection));
    final Paint paint = new Paint()..color = selectionColor;
    for (ui.TextBox box in _selectionRects) {
      context.canvas.drawRect(box.toRect().shift(offset), paint);
    }
    _lastPaintedSelection = selection;
  }
}
