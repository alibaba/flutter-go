import 'package:flutter/material.dart';

import 'controller.dart';
import 'editor.dart';
import 'image.dart';
import 'toolbar.dart';

/// Zefyr editor with material design decorations.
class ZefyrField extends StatefulWidget {
  /// Decoration to paint around this editor.
  final InputDecoration decoration;

  /// Height of this editor field.
  final double height;
  final ZefyrController controller;
  final FocusNode focusNode;
  final bool autofocus;
  final bool enabled;
  final ZefyrToolbarDelegate toolbarDelegate;
  final ZefyrImageDelegate imageDelegate;
  final ScrollPhysics physics;

  const ZefyrField({
    Key key,
    this.decoration,
    this.height,
    this.controller,
    this.focusNode,
    this.autofocus: false,
    this.enabled,
    this.toolbarDelegate,
    this.imageDelegate,
    this.physics,
  }) : super(key: key);

  @override
  _ZefyrFieldState createState() => _ZefyrFieldState();
}

class _ZefyrFieldState extends State<ZefyrField> {
  @override
  Widget build(BuildContext context) {
    Widget child = ZefyrEditor(
      padding: EdgeInsets.symmetric(vertical: 6.0),
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      enabled: widget.enabled ?? true,
      toolbarDelegate: widget.toolbarDelegate,
      imageDelegate: widget.imageDelegate,
      physics: widget.physics,
    );

    if (widget.height != null) {
      child = ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: widget.height),
        child: child,
      );
    }

    return AnimatedBuilder(
      animation:
          Listenable.merge(<Listenable>[widget.focusNode, widget.controller]),
      builder: (BuildContext context, Widget child) {
        return InputDecorator(
          decoration: _getEffectiveDecoration(),
          isFocused: widget.focusNode.hasFocus,
          isEmpty: widget.controller.document.length == 1,
          child: child,
        );
      },
      child: child,
    );
  }

  InputDecoration _getEffectiveDecoration() {
    final InputDecoration effectiveDecoration =
        (widget.decoration ?? const InputDecoration())
            .applyDefaults(Theme.of(context).inputDecorationTheme)
            .copyWith(
              enabled: widget.enabled ?? true,
            );

    return effectiveDecoration;
  }
}
