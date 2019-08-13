// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group('$DecoratedBox', () {
    // TODO(het): Re-enable test for painting foreground and background once we
    //            have painting.

    testWidgets('Bordered Container insets its child',
        (WidgetTester tester) async {
      const Key key = const Key('outerContainer');
      await tester.pumpWidget(new Center(
          child: new Container(
              key: key,
              decoration:
                  new BoxDecoration(border: new Border.all(width: 10.0)),
              child: new Container(width: 25.0, height: 25.0))));
      expect(tester.getSize(find.byKey(key)), equals(const Size(45.0, 45.0)));
    });
  });
}
