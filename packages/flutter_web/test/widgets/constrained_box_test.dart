// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group('$ConstrainedBox', () {
    testWidgets('sets tight constraint', (WidgetTester tester) async {
      await tester.pumpWidget(new Directionality(
        textDirection: TextDirection.ltr,
        child: new Center(
          child: new ConstrainedBox(
            constraints: new BoxConstraints.tight(const Size(50.0, 60.0)),
            child: new Text('Hello'),
          ),
        ),
      ));

      final RenderBox renderText = tester.renderObject(find.byType(Text));
      expect(renderText.size, const Size(50.0, 60.0));
      final BoxParentData parentData =
          tester.renderObject(find.byType(ConstrainedBox)).parentData;
      expect(parentData.offset, const Offset(375.0, 270.0));
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('sets min and max constraint', (WidgetTester tester) async {
      await tester.pumpWidget(new Directionality(
        textDirection: TextDirection.ltr,
        child: new Center(
          child: new ConstrainedBox(
            constraints: new BoxConstraints(
                minWidth: 50.0,
                maxWidth: 60.0,
                minHeight: 100.0,
                maxHeight: 200.0),
            child: new Text('Hello'),
          ),
        ),
      ));

      final RenderBox renderText = tester.renderObject(find.byType(Text));
      expect(renderText.size, const Size(60.0, 100.0));
      final BoxParentData parentData =
          tester.renderObject(find.byType(ConstrainedBox)).parentData;
      expect(parentData.offset, const Offset(370.0, 250.0));
      expect(find.text('Hello'), findsOneWidget);
    });

    test('throws error if given invalid constraints', () {
      expect(
          () => new ConstrainedBox(constraints: null, child: new Text('Hello')),
          throwsAssertionError);
    });
  });
}
