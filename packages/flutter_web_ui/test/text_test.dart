// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web_ui/ui.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  const double baselineRatio = 1.1662499904632568;

  testWidgets('predictably lays out a single-line paragraph',
      (WidgetTester tester) async {
    for (double fontSize in <double>[10.0, 20.0, 30.0, 40.0]) {
      final ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
        fontFamily: 'Ahem',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
      ));
      builder.addText('Test');
      final Paragraph paragraph = builder.build();
      paragraph.layout(const ParagraphConstraints(width: 400.0));

      expect(paragraph.height, fontSize);
      expect(paragraph.width, 400.0);
      expect(paragraph.minIntrinsicWidth, fontSize * 4.0);
      expect(paragraph.maxIntrinsicWidth, fontSize * 4.0);
      expect(paragraph.alphabeticBaseline, fontSize * .8);
      expect(
        paragraph.ideographicBaseline,
        moreOrLessEquals(paragraph.alphabeticBaseline * baselineRatio,
            epsilon: 0.001),
      );
    }
  });

  testWidgets('predictably lays out a multi-line paragraph',
      (WidgetTester tester) async {
    for (double fontSize in <double>[10.0, 20.0, 30.0, 40.0]) {
      final ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
        fontFamily: 'Ahem',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
      ));
      builder.addText('Test Ahem');
      final Paragraph paragraph = builder.build();
      paragraph.layout(ParagraphConstraints(width: fontSize * 5.0));

      expect(paragraph.height, fontSize * 2.0); // because it wraps
      expect(paragraph.width, fontSize * 5.0);
      expect(paragraph.minIntrinsicWidth, fontSize * 4.0);

      // TODO(yjbanov): due to https://github.com/flutter/flutter/issues/21965
      //                Flutter reports a different number. Ours is correct
      //                though.
      expect(paragraph.maxIntrinsicWidth, fontSize * 9.0);
      expect(paragraph.alphabeticBaseline, fontSize * .8);
      expect(
        paragraph.ideographicBaseline,
        moreOrLessEquals(paragraph.alphabeticBaseline * baselineRatio,
            epsilon: 0.001),
      );
    }
  });

  test('lay out unattached paragraph', () {
    final ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
      fontFamily: 'sans-serif',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ));
    builder.addText('How do you do this fine morning?');
    final Paragraph paragraph = builder.build();

    expect(paragraph.webOnlyGetParagraphElement().parent, isNull);
    expect(paragraph.height, 0.0);
    expect(paragraph.width, -1.0);
    expect(paragraph.minIntrinsicWidth, 0.0);
    expect(paragraph.maxIntrinsicWidth, 0.0);
    expect(paragraph.alphabeticBaseline, -1.0);
    expect(paragraph.ideographicBaseline, -1.0);

    paragraph.layout(const ParagraphConstraints(width: 60.0));

    expect(paragraph.webOnlyGetParagraphElement().parent, isNull);
    expect(paragraph.height, greaterThan(0.0));
    expect(paragraph.width, greaterThan(0.0));
    expect(paragraph.minIntrinsicWidth, greaterThan(0.0));
    expect(paragraph.maxIntrinsicWidth, greaterThan(0.0));
    expect(paragraph.minIntrinsicWidth, lessThan(paragraph.maxIntrinsicWidth));
    expect(paragraph.alphabeticBaseline, greaterThan(0.0));
    expect(paragraph.ideographicBaseline, greaterThan(0.0));
  });

  Paragraph measure(
      {String text = 'Hello', double fontSize = 14.0, double width = 50.0}) {
    final ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
      fontFamily: 'sans-serif',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: fontSize,
    ));
    builder.addText(text);
    final Paragraph paragraph = builder.build();
    paragraph.layout(ParagraphConstraints(width: width));
    return paragraph;
  }

  test('baseline increases with font size', () {
    Paragraph previousParagraph = measure(fontSize: 10.0);
    for (int i = 0; i < 6; i++) {
      final double fontSize = 20.0 + 10.0 * i;
      final Paragraph paragraph = measure(fontSize: fontSize);
      expect(paragraph.alphabeticBaseline,
          greaterThan(previousParagraph.alphabeticBaseline));
      expect(paragraph.ideographicBaseline,
          greaterThan(previousParagraph.ideographicBaseline));
      previousParagraph = paragraph;
    }
  });

  test('baseline does not depend on text', () {
    final Paragraph golden = measure(fontSize: 30.0);
    for (int i = 1; i < 30; i++) {
      final Paragraph paragraph = measure(text: 'hello ' * i, fontSize: 30.0);
      expect(paragraph.alphabeticBaseline, golden.alphabeticBaseline);
      expect(paragraph.ideographicBaseline, golden.ideographicBaseline);
    }
  });

  test('$ParagraphBuilder detects plain text', () {
    ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
      fontFamily: 'sans-serif',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 15.0,
    ));
    builder.addText('hi');
    Paragraph paragraph = builder.build();
    expect(paragraph.webOnlyGetPlainText(), isNotNull);
    expect(paragraph.webOnlyGetParagraphGeometricStyle().fontWeight,
        FontWeight.normal);

    builder = ParagraphBuilder(ParagraphStyle(
      fontFamily: 'sans-serif',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 15.0,
    ));
    builder.pushStyle(TextStyle(fontWeight: FontWeight.bold));
    builder.addText('hi');
    paragraph = builder.build();
    expect(paragraph.webOnlyGetPlainText(), isNotNull);
    expect(paragraph.webOnlyGetParagraphGeometricStyle().fontWeight,
        FontWeight.bold);
  });

  test('$ParagraphBuilder detects rich text', () {
    final ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
      fontFamily: 'sans-serif',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 15.0,
    ));
    builder.addText('h');
    builder.pushStyle(TextStyle(fontWeight: FontWeight.bold));
    builder.addText('i');
    final Paragraph paragraph = builder.build();
    expect(paragraph.webOnlyGetPlainText(), isNull);
    expect(paragraph.webOnlyGetParagraphGeometricStyle().fontWeight,
        FontWeight.normal);
  });

  test('$ParagraphBuilder treats empty text as plain', () {
    final ParagraphBuilder builder = ParagraphBuilder(ParagraphStyle(
      fontFamily: 'sans-serif',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 15.0,
    ));
    builder.pushStyle(TextStyle(fontWeight: FontWeight.bold));
    final Paragraph paragraph = builder.build();
    expect(paragraph.webOnlyGetPlainText(), '');
    expect(paragraph.webOnlyGetParagraphGeometricStyle().fontWeight,
        FontWeight.bold);
  });
}
