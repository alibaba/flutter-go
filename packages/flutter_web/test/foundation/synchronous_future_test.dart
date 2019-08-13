// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_web/foundation.dart';
import 'package:flutter_web_ui/ui.dart' as ui show isWeb;
import '../flutter_test_alternative.dart';

void main() {
  test('SynchronousFuture control test', () async {
    final Future<int> future = SynchronousFuture<int>(42);

    int result;
    future.then<void>((int value) {
      result = value;
    });

    expect(result, equals(42));
    result = null;

    final Future<int> futureWithTimeout =
        future.timeout(const Duration(milliseconds: 1));
    futureWithTimeout.then<void>((int value) {
      result = value;
    });
    expect(result, isNull);
    await futureWithTimeout;
    expect(result, equals(42));
    result = null;

    final Stream<int> stream = future.asStream();

    expect(await stream.single, equals(42));

    bool ranAction = false;
    final Future<int> completeResult = future.whenComplete(() {
      ranAction = true;
      return Future<int>.value(31);
    });

    expect(ranAction, isTrue);
    ranAction = false;

    expect(await completeResult, equals(42));

    Object exception;
    try {
      await future.whenComplete(() {
        // TODO(flutter_web): Remove once b://126556714 is resolved.
        if (ui.isWeb) {
          throw NullThrownError();
        } else {
          throw null;
        }
      });
      // Unreached.
      expect(false, isTrue);
    } catch (e) {
      exception = e;
    }
    expect(exception, isNullThrownError);
  });
}
