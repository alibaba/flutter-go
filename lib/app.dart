/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/5/11
 * Time: 8:48 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_web/foundation.dart' show defaultTargetPlatform;
import 'package:flutter_web/material.dart';
import 'package:flutter_web/scheduler.dart' show timeDilation;

//import 'demos.dart';
import 'home.dart';
import 'options.dart';
import 'scales.dart';
import 'themes.dart';

const int ThemeColor = 0xFFC91B3A;

class App extends StatefulWidget {
  const App({
    Key key,
    this.enablePerformanceOverlay = true,
    this.enableRasterCacheImagesCheckerboard = true,
    this.enableOffscreenLayersCheckerboard = true,
    this.onSendFeedback,
    this.testMode = false,
  }) : super(key: key);

  final bool enablePerformanceOverlay;
  final bool enableRasterCacheImagesCheckerboard;
  final bool enableOffscreenLayersCheckerboard;
  final VoidCallback onSendFeedback;
  final bool testMode;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
//  GalleryOptions _options;
//  Timer _timeDilationTimer;

//  Map<String, WidgetBuilder> _buildRoutes() {
//    // For a different example of how to set up an application routing table
//    // using named routes, consider the example in the Navigator class documentation:
//    // https://docs.flutter.io/flutter/widgets/Navigator-class.html
//    return Map<String, WidgetBuilder>.fromIterable(
//    kAllGalleryDemos,
//    key: (dynamic demo) => '${demo.routeName}',
//    value: (dynamic demo) => demo.buildRoute,
//    );
//  }

  @override
  void initState() {
    super.initState();
//    _options = GalleryOptions(
//      theme: kLightGalleryTheme,
//      textScaleFactor: kAllGalleryTextScaleValues[0],
//      timeDilation: timeDilation,
//      platform: defaultTargetPlatform,
//    );
  }

  @override
  void dispose() {
//    _timeDilationTimer?.cancel();
//    _timeDilationTimer = null;
    super.dispose();
  }

//  void _handleOptionsChanged(GalleryOptions newOptions) {
//    setState(() {
//      if (_options.timeDilation != newOptions.timeDilation) {
//        _timeDilationTimer?.cancel();
//        _timeDilationTimer = null;
//        if (newOptions.timeDilation > 1.0) {
//          // We delay the time dilation change long enough that the user can see
//          // that UI has started reacting and then we slam on the brakes so that
//          // they see that the time is in fact now dilated.
//          _timeDilationTimer = Timer(const Duration(milliseconds: 150), () {
//            timeDilation = newOptions.timeDilation;
//          });
//        } else {
//          timeDilation = newOptions.timeDilation;
//        }
//      }
//
//      _options = newOptions;
//    });
//  }
//
//  Widget _applyTextScaleFactor(Widget child) {
//    return Builder(
//      builder: (BuildContext context) {
//        return MediaQuery(
//          data: MediaQuery.of(context).copyWith(
//            textScaleFactor: _options.textScaleFactor.scale,
//          ),
//          child: child,
//        );
//      },
//    );
//  }

  @override
  Widget build(BuildContext context) {
    Widget home = Home(
//      testMode: widget.testMode,
//      optionsPage: GalleryOptionsPage(
//        options: _options,
//        onOptionsChanged: _handleOptionsChanged,
//        onSendFeedback: widget.onSendFeedback ??
//                () {
//              // TODO: launch('https://github.com/flutter/flutter/issues/new', forceSafariVC: false);
//            },
//      ),
    );

    return new MaterialApp(
      title: 'title',
      theme: new ThemeData(
        primaryColor: Color(ThemeColor),
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(ThemeColor),
          size: 35.0,
        ),
      ),
      home: new Scaffold(body: home),
      debugShowCheckedModeBanner: false,
      /// onGenerateRoute: Application.router.generator,
      /// navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );

//    return MaterialApp(
//      theme: _options.theme.data.copyWith(platform: _options.platform),
//      title: 'Flutter Web Gallery',
//      color: Colors.grey,
//      showPerformanceOverlay: _options.showPerformanceOverlay,
//      checkerboardOffscreenLayers: _options.showOffscreenLayersCheckerboard,
//      checkerboardRasterCacheImages: _options.showRasterCacheImagesCheckerboard,
//      //routes: _buildRoutes(),
//      builder: (BuildContext context, Widget child) {
//        return Directionality(
//          textDirection: _options.textDirection,
//          child: _applyTextScaleFactor(child),
//        );
//      },
//    //  home: Text('123123123123123123--'),
//      home: home,
//    );
  }
}
