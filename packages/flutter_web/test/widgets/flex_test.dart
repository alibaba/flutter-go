// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';

import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group('$Row', () {
    testWidgets('renders Row with 2 text spans', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: TestSizedBoxWithElement.expand()),
            Expanded(flex: 1, child: TestSizedBoxWithElement.expand()),
          ],
        ),
      ));

      final boxes = tester.renderObjectList(find.byType(Expanded)).toList();
      RenderBox first = boxes[0];
      expect(first.size, const Size(400.0, 600.0));
      expect(
          (first.parentData as FlexParentData).offset, const Offset(0.0, 0.0));

      RenderBox second = boxes[1];
      expect(second.size, const Size(400.0, 600.0));
      expect((second.parentData as FlexParentData).offset,
          const Offset(400.0, 0.0));

      expectCurrentHtml('''
<clip style="overflow: hidden"><clip-i></clip-i></clip>
<clip style="overflow: hidden"><clip-i></clip-i></clip>
      ''');
    });
  });

  group('$Column', () {
    testWidgets('renders Column with 2 text spans',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: <Widget>[
            Expanded(flex: 1, child: TestSizedBoxWithElement.expand()),
            Expanded(flex: 1, child: TestSizedBoxWithElement.expand()),
          ],
        ),
      ));

      final boxes = tester.renderObjectList(find.byType(Expanded)).toList();
      RenderBox first = boxes[0];
      expect(first.size, const Size(800.0, 300.0));
      expect(
          (first.parentData as FlexParentData).offset, const Offset(0.0, 0.0));

      RenderBox second = boxes[1];
      expect(second.size, const Size(800.0, 300.0));
      expect((second.parentData as FlexParentData).offset,
          const Offset(0.0, 300.0));

      expectCurrentHtml('''
<clip style="overflow: hidden"><clip-i></clip-i></clip>
<clip style="overflow: hidden"><clip-i></clip-i></clip>
      ''');
    });
  });
}
