// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group('$Padding', () {
    testWidgets('sets padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        new Directionality(
          textDirection: TextDirection.ltr,
          child: new Padding(
            padding: new EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0),
            child: new SizedBox.expand(),
          ),
        ),
      );

      // The window is 800x600
      final RenderBox box = tester.renderObject(find.byType(SizedBox));
      expect(box.size, const Size(796.0, 594.0));
      final BoxParentData parentData = box.parentData;
      expect(parentData.offset, const Offset(1.0, 2.0));
    });
  });
}
