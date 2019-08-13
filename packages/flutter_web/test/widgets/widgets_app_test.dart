// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

final _black = const Color.fromARGB(255, 0, 0, 0);

void main() {
  group('$WidgetsApp', () {
    testWidgets('sets text direction', (WidgetTester tester) async {
      await tester.pumpWidget(
        new WidgetsApp(
          color: _black,
          pageRouteBuilder:
              <T>(RouteSettings settings, WidgetBuilder builder) =>
                  MaterialPageRoute<T>(settings: settings, builder: builder),
          builder: (_, __) => new Text('no direction'),
        ),
      );

      // Normally having a text with no direction would cause apps to throw,
      // but WidgetsApp sets the direction.
      await tester.pump();
    });

    testWidgets('sets a default text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        new WidgetsApp(
          color: _black,
          textStyle: new TextStyle(fontFamily: 'FakeFont'),
          pageRouteBuilder:
              <T>(RouteSettings settings, WidgetBuilder builder) =>
                  MaterialPageRoute<T>(settings: settings, builder: builder),
          builder: (_, __) => new Text('hello'),
        ),
      );

      RichText text = tester.firstWidget(find.byType(RichText));
      expect(text.text.style.fontFamily, 'FakeFont');
    });
  });
}
