// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web_test/flutter_web_test.dart';
import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/widgets.dart';

void main() {
  testWidgets('toString control test', (WidgetTester tester) async {
    await tester.pumpWidget(
        const Center(child: Text('Hello', textDirection: TextDirection.ltr)));
    final HitTestResult result = tester.hitTestOnBinding(Offset.zero);
    expect(result, hasOneLineDescription);
    expect(result.path.first, hasOneLineDescription);
  });
}
