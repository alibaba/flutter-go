// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:flutter_web/src/widgets/web_navigator.dart';
import 'package:flutter_web_ui/src/engine.dart' hide MethodCall;
import 'package:flutter_web_test/flutter_web_test.dart';

const Key tap1 = Key('tap1');
const Key tap2 = Key('tap2');
const Key back = Key('back');

const Key page1 = Key('page1');
const Key page2 = Key('page2');

/// Click the browser's back button.
Future<void> browserBack(WidgetTester tester) {
  return tester.runAsync(() => window.webOnlyBack());
}

/// Tap a button given its key.
Future<void> tapAndSettle(WidgetTester tester, Key key) async {
  await tester.tap(find.byKey(key));
  await tester.pumpAndSettle();
}

void expectPage(Key key, String url, {bool exists = true}) {
  if (exists) {
    expect(find.byKey(key), findsOneWidget);
    expect(_strategy.path, url);
  } else {
    expect(find.byKey(key), findsNothing);
    expect(_strategy.path, isNot(url));
  }
}

TestLocationStrategy _strategy;

void main() {
  group('$BrowserHistory', () {
    setUp(() {
      window.webOnlyLocationStrategy = _strategy = TestLocationStrategy();
    });

    tearDown(() {
      window.webOnlyLocationStrategy = _strategy = null;
    });

    testWidgets('browser back button pops routes correctly',
        (WidgetTester tester) async {
      // Initially, we should be on page1.
      await tester.pumpWidget(MyApp());
      expectPage(page1, '/', exists: true);
      expectPage(page2, '/page2', exists: false);
      expect(_strategy.path, '/');

      // Navigate to page2.
      await tapAndSettle(tester, tap2);
      expectPage(page1, '/', exists: false);
      expectPage(page2, '/page2', exists: true);
      expect(_strategy.path, '/page2');

      // Clicking back should take us to page1.
      await browserBack(tester);
      await tester.pumpAndSettle();
      expectPage(page1, '/', exists: true);
      expectPage(page2, '/page2', exists: false);
      expect(_strategy.path, '/');

      // We should still be inside the app.
      expect(_strategy.withinAppHistory, isTrue);
    });

    testWidgets('browser back button can exit the app',
        (WidgetTester tester) async {
      final List<MethodCall> log = <MethodCall>[];
      SystemChannels.platform.setMockMethodCallHandler((MethodCall methodCall) {
        log.add(methodCall);
        return null;
      });

      await tester.pumpWidget(MyApp());

      final Matcher systemNavigatorPop =
          isMethodCall('SystemNavigator.pop', arguments: null);
      expect(log, isNot(contains(systemNavigatorPop)));

      // Clicking back should close the app by calling [SystemNavigator.pop].
      await browserBack(tester);
      await tester.pumpAndSettle();
      expect(log, contains(systemNavigatorPop));

      // Remove the mock handler.
      SystemChannels.platform.setMockMethodCallHandler(null);
    });

    testWidgets('multiple browser back clicks', (WidgetTester tester) async {
      final List<MethodCall> log = <MethodCall>[];
      SystemChannels.platform.setMockMethodCallHandler((MethodCall methodCall) {
        log.add(methodCall);
        return null;
      });

      // Start on page1.
      await tester.pumpWidget(MyApp());
      // Navigate to page2.
      await tapAndSettle(tester, tap2);
      // Navigate to page1.
      await tapAndSettle(tester, tap1);

      // Make sure we are on page1.
      expectPage(page1, '/', exists: true);
      expectPage(page2, '/page2', exists: false);

      // Back to page2.
      await browserBack(tester);
      await tester.pumpAndSettle();
      expectPage(page1, '/', exists: false);
      expectPage(page2, '/page2', exists: true);

      // Back to page1.
      await browserBack(tester);
      await tester.pumpAndSettle();
      expectPage(page1, '/', exists: true);
      expectPage(page2, '/page2', exists: false);

      final Matcher systemNavigatorPop =
          isMethodCall('SystemNavigator.pop', arguments: null);
      expect(log, isNot(contains(systemNavigatorPop)));

      // Exit the app.
      await browserBack(tester);
      await tester.pumpAndSettle();
      expect(log, contains(systemNavigatorPop));

      // Remove the mock handler.
      SystemChannels.platform.setMockMethodCallHandler(null);
    });

    testWidgets('route names are updated', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(_strategy.path, '/');

      await tapAndSettle(tester, tap2);
      expect(_strategy.path, '/page2');

      await tapAndSettle(tester, back);
      expect(_strategy.path, '/');
    });

    testWidgets('SystemNavigator.pop exits', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.runAsync(() => SystemNavigator.pop());
      expect(_strategy.withinAppHistory, isFalse);
    });

    testWidgets('handle user-provided url', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.runAsync(() async {
        await _strategy.simulateUserTypingUrl('/page2');
        // This delay is necessary to wait for [BrowserHistory] because it
        // performs a `back` operation which results in a new event loop.
        await Future<void>.delayed(Duration.zero);
      });
      await tester.pumpAndSettle();

      expectPage(page2, '/page2', exists: true);
      expect(_strategy.path, '/page2');

      await tapAndSettle(tester, back);
      expectPage(page1, '/', exists: true);
      expect(_strategy.path, '/');
    });

    testWidgets('user types unknown url', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.runAsync(() async {
        await _strategy.simulateUserTypingUrl('/unknown');
        // This delay is necessary to wait for [BrowserHistory] because it
        // performs a `back` operation which results in a new event loop.
        await Future<void>.delayed(Duration.zero);
      });
      await tester.pumpAndSettle();

      // We should remain on the same page.
      expectPage(page1, '/', exists: true);
      expect(_strategy.path, '/');
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[WebOnlyNavigatorObserver()],
      routes: <String, WidgetBuilder>{
        '/': (_) =>
            MyPage(key: page1, child: const Text('Content of home page')),
        '/page2': (_) =>
            MyPage(key: page2, child: const Text('Content of page 2')),
      },
    );
  }
}

class MyPage extends StatelessWidget {
  final Widget child;

  MyPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          FlatButton(
            key: back,
            child: const Text('< back'),
            onPressed: () => Navigator.pop(context),
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                key: tap1,
                child: const Text('Home'),
                onPressed: () => Navigator.pushNamed(context, '/'),
              ),
              RaisedButton(
                key: tap2,
                child: const Text('Page 2'),
                onPressed: () => Navigator.pushNamed(context, '/page2'),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}
