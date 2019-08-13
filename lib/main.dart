// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_go/app.dart';
import 'package:flutter_go/newApp.dart';

import 'package:flutter_go/routers/fluro/fluro.dart';
import 'package:flutter_go/routers/routers.dart';
import 'package:flutter_go/routers/application.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;

  /// runApp(App());
  runApp(MyApp());
}
