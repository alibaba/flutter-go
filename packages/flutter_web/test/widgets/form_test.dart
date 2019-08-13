// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group(Form, () {
    testWidgets('is inheritable', (WidgetTester tester) async {
      FormState inheritedForm;
      await tester.pumpWidget(Form(child: Builder(builder: (context) {
        inheritedForm = Form.of(context);
        return Text('', textDirection: TextDirection.ltr);
      })));
      expect(inheritedForm is FormState, true);
    });

    testWidgets('call onSaved of its descendant FormField',
        (WidgetTester tester) async {
      final buildLog = Set<String>();
      String savedValue;
      int count = 0;

      FormFieldState<String> fieldState;

      await tester.pumpWidget(Form(
        child: FormField<String>(
          initialValue: 'foo',
          onSaved: (String value) {
            savedValue = value;
            count++;
          },
          builder: (FormFieldState<String> s) {
            fieldState = s;
            buildLog.add(fieldState.value);
            return Text(fieldState.value, textDirection: TextDirection.ltr);
          },
        ),
      ));
      expect(buildLog, <String>['foo']);

      expect(savedValue, isNull);
      expect(count, 0);

      fieldState.didChange('bar');

      FormState formState = tester.state(find.byType(Form));
      formState.save();
      await tester.pump();

      expect(savedValue, 'bar');
      expect(count, 1);
      expect(buildLog, <String>['foo', 'bar']);
    });
  });
}
