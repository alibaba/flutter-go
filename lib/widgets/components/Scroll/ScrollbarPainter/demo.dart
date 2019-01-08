/*
 * @Author: 一凨 
 * @Date: 2018-12-15 16:25:39 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-15 19:36:43
 */

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

const double _kScrollbarThickness = 16.0;
const Duration _kScrollbarFadeDuration = Duration(milliseconds: 300);
const Duration _kScrollbarTimeToFade = Duration(milliseconds: 600);

class PaintDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ScrollbarPainterDemo(
          child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 100.0,
            color: Colors.blue,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'test$index',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          );
        },
      )),
    );
  }
}

class ScrollbarPainterDemo extends StatefulWidget {
  const ScrollbarPainterDemo({
    Key key,
    @required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  _ScrollbarPainterDemoState createState() => _ScrollbarPainterDemoState();
}

class _ScrollbarPainterDemoState extends State<ScrollbarPainterDemo>
    with TickerProviderStateMixin {
  ScrollbarPainter _materialPainter;
  TargetPlatform _currentPlatform;
  TextDirection _textDirection;
  Color _themeColor;

  AnimationController _fadeoutAnimationController;
  Animation<double> _fadeoutOpacityAnimation;
  Timer _fadeoutTimer;

  @override
  void initState() {
    super.initState();
    _fadeoutAnimationController = AnimationController(
      vsync: this,
      duration: _kScrollbarFadeDuration,
    );
    _fadeoutOpacityAnimation = CurvedAnimation(
        parent: _fadeoutAnimationController, curve: Curves.fastOutSlowIn);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ThemeData theme = Theme.of(context);
    _currentPlatform = theme.platform;

    switch (_currentPlatform) {
      case TargetPlatform.iOS:
        // On iOS, stop all local animations. CupertinoScrollbar has its own
        // animations.
        _fadeoutTimer?.cancel();
        _fadeoutTimer = null;
        _fadeoutAnimationController.reset();
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        _themeColor = theme.primaryColor.withOpacity(1.0);
        _textDirection = Directionality.of(context);
        _materialPainter = _buildMaterialScrollbarPainter();
        break;
    }
  }

  ScrollbarPainter _buildMaterialScrollbarPainter() {
    return ScrollbarPainter(
      color: _themeColor,
      textDirection: _textDirection,
      thickness: _kScrollbarThickness,
      fadeoutOpacityAnimation: _fadeoutOpacityAnimation,
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // iOS sub-delegates to the CupertinoScrollbar instead and doesn't handle
    // scroll notifications here.
    if (_currentPlatform != TargetPlatform.iOS &&
        (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification)) {
      if (_fadeoutAnimationController.status != AnimationStatus.forward) {
        _fadeoutAnimationController.forward();
      }

      _materialPainter.update(
          notification.metrics, notification.metrics.axisDirection);
      _fadeoutTimer?.cancel();
      _fadeoutTimer = Timer(_kScrollbarTimeToFade, () {
        _fadeoutAnimationController.reverse();
        _fadeoutTimer = null;
      });
    }
    return false;
  }

  @override
  void dispose() {
    _fadeoutAnimationController.dispose();
    _fadeoutTimer?.cancel();
    _materialPainter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentPlatform) {
      case TargetPlatform.iOS:
        return CupertinoScrollbar(
          child: widget.child,
        );
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return NotificationListener<ScrollNotification>(
          onNotification: _handleScrollNotification,
          child: RepaintBoundary(
            child: CustomPaint(
              foregroundPainter: _materialPainter,
              child: RepaintBoundary(
                child: widget.child,
              ),
            ),
          ),
        );
    }
    throw FlutterError('Unknown platform for scrollbar insertion');
  }
}
