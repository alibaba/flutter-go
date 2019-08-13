// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';
import 'package:flutter_web_ui/ui.dart' as ui;

void main() {
  group('$MediaQuery', () {
    setUp(() {
      width = null;
      height = null;
      pixelRatio = null;
    });

    testWidgets('provides window properties', (WidgetTester tester) async {
      var testMediaWidget = new TestMediaWidget();
      await tester.pumpWidget(
        new MediaQuery(
          data: new MediaQueryData.fromWindow(ui.window),
          child: testMediaWidget,
        ),
      );
      expect(width, isNotNull);
      expect(height, isNotNull);
      expect(pixelRatio, isNotNull);
    });
  });
}

double width;
double height;
double pixelRatio;

class TestMediaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.of(context);
    width = data.size.width;
    height = data.size.height;
    pixelRatio = data.devicePixelRatio;
    return new Text('dummy text', textDirection: TextDirection.ltr);
  }
}
