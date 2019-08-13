// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

import 'dart:html' show document;

void main() {
  group('$Title', () {
    testWidgets('sets title and theme color', (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Title(
          title: 'Title Test',
          color: Color.fromARGB(255, 255, 0, 255),
          child: Text('Hello'),
        ),
      ));
      expect(find.text('Hello'), findsOneWidget);

      expect(document.title, 'Title Test');

      var theme = document.querySelector('#flutterweb-theme');
      expect(theme.attributes['name'], 'theme-color');
      expect(theme.attributes['content'], '#ff00ff');

      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Title(
          title: 'Different title',
          color: Color.fromARGB(255, 0, 0, 0),
          child: Text('See ya!'),
        ),
      ));
      expect(find.text('See ya!'), findsOneWidget);

      expect(document.title, 'Different title');
      expect(theme.attributes['content'], '#000000');
    });
  });
}
