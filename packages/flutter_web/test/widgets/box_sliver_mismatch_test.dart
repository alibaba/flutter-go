// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Synced 2019-05-30T14:20:56.976893.

import 'package:flutter_web_test/flutter_web_test.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web/widgets.dart';

void main() {
  testWidgets('Sliver in a box', (WidgetTester tester) async {
    await tester.pumpWidget(
      DecoratedBox(
        decoration: const BoxDecoration(),
        child: SliverList(
          delegate: SliverChildListDelegate(const <Widget>[]),
        ),
      ),
    );

    expect(tester.takeException(), isFlutterError);

    await tester.pumpWidget(
      Row(
        children: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(const <Widget>[]),
          ),
        ],
      ),
    );

    expect(tester.takeException(), isFlutterError);
  });

  testWidgets('Box in a sliver', (WidgetTester tester) async {
    await tester.pumpWidget(
      Viewport(
        crossAxisDirection: AxisDirection.right,
        offset: ViewportOffset.zero(),
        slivers: const <Widget>[
          SizedBox(),
        ],
      ),
    );

    expect(tester.takeException(), isFlutterError);

    await tester.pumpWidget(
      Viewport(
        crossAxisDirection: AxisDirection.right,
        offset: ViewportOffset.zero(),
        slivers: const <Widget>[
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SizedBox(),
          ),
        ],
      ),
    );

    expect(tester.takeException(), isFlutterError);
  });
}
