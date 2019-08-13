// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:test/test.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web_ui/ui.dart';

void main() {
  test('RenderFractionallySizedBox constraints', () {
    RenderBox root, leaf, test;
    root = new RenderPositionedBox(
      child: new RenderConstrainedBox(
        additionalConstraints:
            new BoxConstraints.tight(const Size(200.0, 200.0)),
        child: test = new RenderFractionallySizedOverflowBox(
          widthFactor: 2.0,
          heightFactor: 0.5,
          child: leaf = new RenderConstrainedBox(
            additionalConstraints: const BoxConstraints.expand(),
          ),
        ),
      ),
    );
    root.layout(BoxConstraints.tight(Size(800.0, 600.0)));
    expect(root.size.width, equals(800.0));
    expect(root.size.height, equals(600.0));
    expect(test.size.width, equals(200.0));
    expect(test.size.height, equals(200.0));
    expect(leaf.size.width, equals(400.0));
    expect(leaf.size.height, equals(100.0));
  });

  test('BoxConstraints with NaN', () {
    String result;
    final String noException = 'no exception';
    result = noException;
    try {
      const BoxConstraints constraints = const BoxConstraints(
          minWidth: double.nan,
          maxWidth: double.nan,
          minHeight: 2.0,
          maxHeight: double.nan);
      assert(constraints.debugAssertIsValid());
    } catch (e) {
      result = '$e';
    }
    expect(result, isNot(noException));

    result = noException;
    try {
      const BoxConstraints constraints =
          const BoxConstraints(minHeight: double.nan);
      assert(constraints.debugAssertIsValid());
    } catch (e) {
      result = '$e';
    }
    expect(result, isNot(noException));

    result = noException;
    try {
      const BoxConstraints constraints =
          const BoxConstraints(minHeight: double.nan, maxWidth: 0.0 / 0.0);
      assert(constraints.debugAssertIsValid());
    } catch (e) {
      result = '$e';
    }
    expect(result, isNot(noException));
  });
}
