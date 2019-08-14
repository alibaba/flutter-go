import 'package:flutter_web/material.dart';
import 'package:flutter_go/newApp.dart';

import 'package:flutter_go/routers/fluro/fluro.dart';
import 'package:flutter_go/routers/routers.dart';
import 'package:flutter_go/routers/application.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}
