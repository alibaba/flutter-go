import 'dart:async';

import 'package:flutter/material.dart';

/// Helper class that keeps state relevant to the editing cursor.
class CursorTimer {
  static const _kCursorBlinkHalfPeriod = const Duration(milliseconds: 500);

  Timer _timer;
  final ValueNotifier<bool> _showCursor = new ValueNotifier<bool>(false);

  ValueNotifier<bool> get value => _showCursor;

  void _cursorTick(Timer timer) {
    _showCursor.value = !_showCursor.value;
  }

  /// Starts cursor timer.
  void start() {
    _showCursor.value = true;
    _timer = new Timer.periodic(_kCursorBlinkHalfPeriod, _cursorTick);
  }

  /// Stops cursor timer.
  void stop() {
    _timer?.cancel();
    _timer = null;
    _showCursor.value = false;
  }

  /// Starts or stops cursor timer based on current state of [focusNode]
  /// and [selection].
  void startOrStop(FocusNode focusNode, TextSelection selection) {
    final hasFocus = focusNode.hasFocus;
    final selectionCollapsed = selection.isCollapsed;
    if (_timer == null && hasFocus && selectionCollapsed) {
      start();
    } else if (_timer != null && (!hasFocus || !selectionCollapsed)) {
      stop();
    }
  }
}
