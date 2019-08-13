import 'dart:html';

import 'package:flutter_web_ui/src/engine.dart';
import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  const MethodCodec codec = JSONMethodCodec();

  group('Title', () {
    test('is set on the document by platform message', () {
      // Run the unit test without emulating Flutter tester environment.
      ui.debugEmulateFlutterTesterEnvironment = false;

      expect(document.title, '');

      ui.window.sendPlatformMessage(
          'flutter/platform',
          codec.encodeMethodCall(const MethodCall(
              'SystemChrome.setApplicationSwitcherDescription',
              <String, dynamic>{
                'label': 'Title Test',
                'primaryColor': 0xFF00FF00,
              })),
          null);

      expect(document.title, 'Title Test');

      ui.window.sendPlatformMessage(
          'flutter/platform',
          codec.encodeMethodCall(const MethodCall(
              'SystemChrome.setApplicationSwitcherDescription',
              <String, dynamic>{
                'label': 'Different title',
                'primaryColor': 0xFF00FF00,
              })),
          null);

      expect(document.title, 'Different title');
    });
  });
}
