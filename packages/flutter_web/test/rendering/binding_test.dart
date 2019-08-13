// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web_ui/ui.dart' as ui;

import 'package:flutter_web_test/flutter_web_test.dart';

import '../rendering/rendering_tester.dart';

main() {
  test('$RendererBinding flushes layout on every frame', () async {
    int callCount = 0;
    ui.webOnlyScheduleFrameCallback = () {
      callCount++;
    };

    final TestRenderingFlutterBinding renderingBinding =
        TestRenderingFlutterBinding();
    SchedulerBinding.instance.addPersistentFrameCallback((Duration duration) {
      renderingBinding.drawFrame();
    });

    void drawFrame() {
      expect(SchedulerBinding.instance.hasScheduledFrame, true);
      SchedulerBinding.instance
        ..handleBeginFrame(Duration(milliseconds: 100))
        ..handleDrawFrame();
      expect(SchedulerBinding.instance.hasScheduledFrame, false);
    }

    expect(RendererBinding.instance.renderView.debugNeedsLayout, true);
    drawFrame();
    expect(SchedulerBinding.instance.hasScheduledFrame, false);

    expect(callCount, 1); // schedules initial frame
    expect(RendererBinding.instance.renderView.debugNeedsLayout, false);

    final testObject = new _TestRenderObject();
    RendererBinding.instance.renderView.child = testObject;
    expect(callCount, 2); // tree restructured, expect a new frame scheduled
    drawFrame();
    expect(SchedulerBinding.instance.hasScheduledFrame, false);

    expect(testObject.performLayoutCount, 1);
    expect(callCount, 2); // no new frames; just flush layout
  });
}

class _TestRenderObject extends RenderBox {
  int performLayoutCount = 0;

  @override
  void debugAssertDoesMeetConstraints() {}

  @override
  Rect get paintBounds => null;

  @override
  void performLayout() {
    performLayoutCount++;
  }

  @override
  void performResize() {}
}
