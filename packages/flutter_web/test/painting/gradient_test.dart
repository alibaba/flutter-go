// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/painting.dart';
import 'package:flutter_web_ui/ui.dart';

import 'package:test/test.dart';

void main() {
  group('linear gradient', () {
    test('can convert simple gradient to CSS', () {
      var gradient = new LinearGradient(
        colors: const [const Color(0xff000000), const Color(0xffffffff)],
      );
      expect(
        gradient.toCssString(),
        'linear-gradient(to right, #000000, #ffffff)',
      );
    });

    group('can recognize common alignment scenarios', () {
      test('top to bottom is default', () {
        var gradient = new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [const Color(0xff000000), const Color(0xffffffff)],
        );
        expect(
          gradient.toCssString(),
          'linear-gradient(#000000, #ffffff)',
        );
      });
      test('right to left', () {
        var gradient = new LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: const [const Color(0xff000000), const Color(0xffffffff)],
        );
        expect(
          gradient.toCssString(),
          'linear-gradient(to left, #000000, #ffffff)',
        );
      });
      test('diagonal alignment', () {
        var gradient = new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [const Color(0xff000000), const Color(0xffffffff)],
        );
        expect(
          gradient.toCssString(),
          'linear-gradient(to bottom right, #000000, #ffffff)',
        );
      });
    });

    test('can be given custom stops', () {
      var gradient = new LinearGradient(
        colors: const [const Color(0xff000000), const Color(0xffffffff)],
        stops: [0.2, 0.7],
      );
      expect(
        gradient.toCssString(),
        'linear-gradient(to right, #000000 20%, #ffffff 70%)',
      );
    });

    test('can convert custom alignment to an angle', () {
      var gradient = new LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: const [const Color(0xff000000), const Color(0xffffffff)],
      );
      expect(
        gradient.toCssString(),
        'linear-gradient(1.1071rad, #000000, #ffffff)',
      );
    });

    test('can handle repeated tiling', () {
      var gradient = new LinearGradient(
        tileMode: TileMode.repeated,
        colors: const [const Color(0xff000000), const Color(0xffffffff)],
      );
      expect(
        gradient.toCssString(),
        'repeating-linear-gradient(to right, #000000, #ffffff)',
      );
    });
  });
}
