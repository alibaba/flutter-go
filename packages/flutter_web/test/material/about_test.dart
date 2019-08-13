// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  testWidgets('AboutListTile control test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        title: 'Pirate app',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          drawer: Drawer(
            child: ListView(
              children: const <Widget>[
                AboutListTile(
                    applicationVersion: '0.1.2',
                    applicationIcon: FlutterLogo(),
                    applicationLegalese:
                        'I am the very model of a modern major general.',
                    aboutBoxChildren: <Widget>[
                      Text('About box'),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('About Pirate app'), findsNothing);
    expect(find.text('0.1.2'), findsNothing);
    expect(find.text('About box'), findsNothing);

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('About Pirate app'), findsOneWidget);
    expect(find.text('0.1.2'), findsNothing);
    expect(find.text('About box'), findsNothing);

    await tester.tap(find.text('About Pirate app'));
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    expect(find.text('About Pirate app'), findsOneWidget);
    expect(find.text('0.1.2'), findsOneWidget);
    expect(find.text('About box'), findsOneWidget);
  });

  testWidgets('About box logic defaults to executable name for app name',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        title: 'flutter_tester',
        home: Material(child: AboutListTile()),
      ),
    );
    expect(find.text('About flutter_tester'), findsOneWidget);
  });
}
