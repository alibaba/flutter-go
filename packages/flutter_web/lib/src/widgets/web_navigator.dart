// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/widgets.dart' show NavigatorObserver, Route;

import 'package:flutter_web_ui/ui.dart' as ui;

/// Observes all changes happening in routes and notifies the browser history
/// integration to update the route name.
///
/// In order to fully activate browser history integration, an instance of
/// [WebOnlyNavigatorObserver] has to be added as an observer to [MaterialApp].
///
/// ```dart
/// import 'package:flutter_web/widgets.dart';
///
/// class MyApp extends StatelessWidget {
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       navigatorObservers: [WebOnlyNavigatorObserver()],
///       routes: {
///         '/': (_) => HomePage(),
///         '/page2': (_) => Page2(),
///       },
///     );
///   }
/// }
/// ```
class WebOnlyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    _webOnlyNotifyRouteName(route);
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    _webOnlyNotifyRouteName(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    _webOnlyNotifyRouteName(previousRoute);
  }

  void _webOnlyNotifyRouteName(Route<dynamic> route) {
    final String routeName = route?.settings?.name;
    if (routeName != null) {
      ui.webOnlyRouteName = routeName;
    }
  }
}
