import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notus/notus.dart';

import 'controller.dart';
import 'cursor_timer.dart';
import 'editor.dart';
import 'image.dart';
import 'render_context.dart';
import 'view.dart';

/// Provides access to shared state of [ZefyrEditor] or [ZefyrView].
///
/// A scope object can be created by an editable widget like [ZefyrEditor] in
/// which case it provides access to editing state, including focus nodes,
/// selection and such. Editable scope can be created using
/// [ZefyrScope.editable] constructor.
///
/// If a scope object is created by a view-only widget like [ZefyrView] then
/// it only provides access to [imageDelegate].
///
/// Can be retrieved using [ZefyrScope.of].
class ZefyrScope extends ChangeNotifier {
  /// Creates a view-only scope.
  ///
  /// Normally used in [ZefyrView].
  ZefyrScope.view({@required ZefyrImageDelegate imageDelegate})
      : assert(imageDelegate != null),
        isEditable = false,
        _imageDelegate = imageDelegate;

  /// Creates editable scope.
  ///
  /// Normally used in [ZefyrEditor].
  ZefyrScope.editable({
    @required ZefyrController controller,
    @required ZefyrImageDelegate imageDelegate,
    @required FocusNode focusNode,
    @required FocusScopeNode focusScope,
  })  : assert(controller != null),
        assert(imageDelegate != null),
        assert(focusNode != null),
        assert(focusScope != null),
        isEditable = true,
        _controller = controller,
        _imageDelegate = imageDelegate,
        _focusNode = focusNode,
        _focusScope = focusScope,
        _cursorTimer = CursorTimer(),
        _renderContext = ZefyrRenderContext() {
    _selectionStyle = _controller.getSelectionStyle();
    _selection = _controller.selection;
    _controller.addListener(_handleControllerChange);
    _focusNode.addListener(_handleFocusChange);
  }

  static ZefyrScope of(BuildContext context) {
    final ZefyrScopeAccess widget =
        context.inheritFromWidgetOfExactType(ZefyrScopeAccess);
    return widget.scope;
  }

  ZefyrImageDelegate _imageDelegate;
  ZefyrImageDelegate get imageDelegate => _imageDelegate;
  set imageDelegate(ZefyrImageDelegate value) {
    assert(value != null);
    if (_imageDelegate != value) {
      _imageDelegate = value;
      notifyListeners();
    }
  }

  ZefyrController _controller;
  ZefyrController get controller => _controller;
  set controller(ZefyrController value) {
    assert(isEditable && value != null);
    if (_controller != value) {
      _controller.removeListener(_handleControllerChange);
      _controller = value;
      _selectionStyle = _controller.getSelectionStyle();
      _selection = _controller.selection;
      _controller.addListener(_handleControllerChange);
      notifyListeners();
    }
  }

  FocusNode _focusNode;
  FocusNode get focusNode => _focusNode;
  set focusNode(FocusNode value) {
    assert(isEditable && value != null);
    if (_focusNode != value) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = value;
      _focusNode.addListener(_handleFocusChange);
      notifyListeners();
    }
  }

  FocusScopeNode _focusScope;
  FocusScopeNode get focusScope => _focusScope;
  set focusScope(FocusScopeNode value) {
    assert(isEditable && value != null);
    if (_focusScope != value) {
      _focusScope = value;
    }
  }

  CursorTimer _cursorTimer;
  CursorTimer get cursorTimer => _cursorTimer;
  ValueNotifier<bool> get showCursor => cursorTimer.value;

  ZefyrRenderContext _renderContext;
  ZefyrRenderContext get renderContext => _renderContext;

  NotusStyle get selectionStyle => _selectionStyle;
  NotusStyle _selectionStyle;
  TextSelection get selection => _selection;
  TextSelection _selection;

  bool _disposed = false;
  FocusNode _toolbarFocusNode;

  /// Whether this scope is backed by editable Zefyr widgets or read-only view.
  ///
  /// Returns `true` if this scope provides Zefyr interface that allows editing
  /// (e.g. created by [ZefyrEditor]). Returns `false` if this scope provides
  /// read-only view (e.g. created by [ZefyrView]).
  ///
  /// Editable scope provides access to corresponding [controller], [focusNode],
  /// [focusScope], [showCursor], [renderContext] and other shared objects. For
  /// non-editable scopes these are set to `null`. You can still access
  /// objects which are not dependent on editing flow, e.g. [imageDelegate].
  final bool isEditable;

  set toolbarFocusNode(FocusNode node) {
    assert(isEditable);
    assert(!_disposed || node == null);
    if (_toolbarFocusNode != node) {
      _toolbarFocusNode?.removeListener(_handleFocusChange);
      _toolbarFocusNode = node;
      _toolbarFocusNode?.addListener(_handleFocusChange);
      // We do not notify listeners here because it will happen when
      // focus state changes, see [_handleFocusChange].
    }
  }

  FocusOwner get focusOwner {
    assert(isEditable);
    assert(!_disposed);
    if (_focusNode.hasFocus) {
      return FocusOwner.editor;
    } else if (_toolbarFocusNode?.hasFocus == true) {
      return FocusOwner.toolbar;
    } else {
      return FocusOwner.none;
    }
  }

  void updateSelection(TextSelection value,
      {ChangeSource source: ChangeSource.remote}) {
    assert(isEditable);
    assert(!_disposed);
    _controller.updateSelection(value, source: source);
  }

  void formatSelection(NotusAttribute value) {
    assert(isEditable);
    assert(!_disposed);
    _controller.formatSelection(value);
  }

  void focus() {
    assert(isEditable);
    assert(!_disposed);
    _focusScope.requestFocus(_focusNode);
  }

  void hideKeyboard() {
    assert(isEditable);
    assert(!_disposed);
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    assert(!_disposed);
    _controller?.removeListener(_handleControllerChange);
    _focusNode?.removeListener(_handleFocusChange);
    _disposed = true;
    super.dispose();
  }

  void _handleControllerChange() {
    assert(!_disposed);
    final attrs = _controller.getSelectionStyle();
    final selection = _controller.selection;
    if (_selectionStyle != attrs || _selection != selection) {
      _selectionStyle = attrs;
      _selection = selection;
      notifyListeners();
    }
  }

  void _handleFocusChange() {
    assert(!_disposed);
    if (focusOwner == FocusOwner.none && !_selection.isCollapsed) {
      // Collapse selection if there is nothing focused.
      _controller.updateSelection(_selection.copyWith(
        baseOffset: _selection.extentOffset,
        extentOffset: _selection.extentOffset,
      ));
    }
    notifyListeners();
  }

  @override
  String toString() {
    return '$ZefyrScope#${shortHash(this)}';
  }
}

class ZefyrScopeAccess extends InheritedWidget {
  final ZefyrScope scope;

  ZefyrScopeAccess({Key key, @required this.scope, @required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(ZefyrScopeAccess oldWidget) {
    return scope != oldWidget.scope;
  }
}
