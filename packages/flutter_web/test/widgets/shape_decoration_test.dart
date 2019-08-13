// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

import '../rendering/mock_canvas.dart';

Future<void> main() async {
//  final ui.Image rawImage = await decodeImageFromList(new Uint8List.fromList(kTransparentImage));
//  final ImageProvider image = new TestImageProvider(0, 0, image: rawImage);
//  testWidgets('ShapeDecoration.image', (WidgetTester tester) async {
//    await tester.pumpWidget(
//      new MaterialApp(
//        home: new DecoratedBox(
//          decoration: new ShapeDecoration(
//            shape: new Border.all(width: 1.0, color: Colors.white) +
//                new Border.all(width: 1.0, color: Colors.black),
//            image: new DecorationImage(
//              image: image,
//            ),
//          ),
//        ),
//      ),
//    );
//    expect(
//        find.byType(DecoratedBox),
//        paints
//          ..drawImageRect(image: rawImage)
//          ..rect(color: Colors.black)
//          ..rect(color: Colors.white)
//    );
//  });

  testWidgets('ShapeDecoration.color', (WidgetTester tester) async {
    await tester.pumpWidget(
      new MaterialApp(
        home: new DecoratedBox(
          decoration: new ShapeDecoration(
            shape: new Border.all(width: 1.0, color: Colors.white) +
                new Border.all(width: 1.0, color: Colors.black),
            color: Colors.blue,
          ),
        ),
      ),
    );
    expect(
        find.byType(DecoratedBox),
        paints
          // TODO(yjbanov): we paint with MaterialColor instead of Color, but
          //                Flutter paints with Color. Figure out why.
          ..path(color: Colors.blue)
          ..rect(color: Colors.black)
          ..rect(color: Colors.white));
  });

  testWidgets('TestBorder and Directionality - 1', (WidgetTester tester) async {
    final List<String> log = <String>[];
    await tester.pumpWidget(
      new MaterialApp(
        home: new DecoratedBox(
          decoration: new ShapeDecoration(
            shape: new TestBorder(log.add),
            color: Colors.green,
          ),
        ),
      ),
    );
    expect(
      log,
      <String>[
        'getOuterPath Rect.fromLTRB(0.0, 0.0, 800.0, 600.0) TextDirection.ltr',
        'paint Rect.fromLTRB(0.0, 0.0, 800.0, 600.0) TextDirection.ltr'
      ],
    );
  });

  testWidgets('TestBorder and Directionality - 2', (WidgetTester tester) async {
    final List<String> log = <String>[];
    await tester.pumpWidget(
      new Directionality(
        textDirection: TextDirection.rtl,
        child: new DecoratedBox(
          decoration: new ShapeDecoration(
            shape: new TestBorder(log.add),
// TODO(yjbanov): we don't have in-memory images yet.
//            image: new DecorationImage(
//              image: image,
//            ),
          ),
        ),
      ),
    );
    expect(
      log,
      <String>[
// TODO(yjbanov): not painting the image at the moment.
//        'getInnerPath Rect.fromLTRB(0.0, 0.0, 800.0, 600.0) TextDirection.rtl',
        'paint Rect.fromLTRB(0.0, 0.0, 800.0, 600.0) TextDirection.rtl'
      ],
    );
  });
}

typedef void Logger(String caller);

class TestBorder extends ShapeBorder {
  const TestBorder(this.onLog) : assert(onLog != null);

  final Logger onLog;

  @override
  EdgeInsetsGeometry get dimensions =>
      const EdgeInsetsDirectional.only(start: 1.0);

  @override
  ShapeBorder scale(double t) => new TestBorder(onLog);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    onLog('getInnerPath $rect $textDirection');
    return new Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    onLog('getOuterPath $rect $textDirection');
    return new Path();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    onLog('paint $rect $textDirection');
  }
}
