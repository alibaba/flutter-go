// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group('$ClipRect', () {
    testWidgets('clips the given child', (WidgetTester tester) async {
      tester.pumpWidget(new ClipRect(child: new Image.network('example.png')));
      // TODO(yjbanov): we should learn to test what's going on inside the
      //                <canvas> tag. Porting Flutter's MockCanvas might be good
      //                enough.
      expectCurrentHtml('<pic></pic>');
    });
  });
}
