// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_web/material.dart';
import 'package:flutter_web/animation.dart';
import 'package:flutter_web/src/widgets/ticker_provider.dart';

import 'package:flutter_web_test/flutter_web_test.dart';

const _oneFrame = Duration(milliseconds: 16);

main() {
  group('animation', () {
    testWidgets('animates along a linear curve', (WidgetTester tester) async {
      await tester.pumpWidget(_AnimatingWidget());
      for (int i = 0; i < 10; i++) {
        expect(find.text('$i'), findsOneWidget);
        await tester.pump(_oneFrame);
      }

      // Animation should stop at this point
      expect(find.text('10'), findsOneWidget);
      await tester.pump(_oneFrame);
      expect(find.text('10'), findsOneWidget);
      await tester.pump(_oneFrame);
      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('animates with a physics simulation',
        (WidgetTester tester) async {
      await tester.pumpWidget(_AnimationWithPhysics());
      double previousValue = 0.0;
      for (int i = 0; i < 10; i++) {
        await tester.pump(_oneFrame);
        _AnimationWithPhysicsState state =
            tester.state<_AnimationWithPhysicsState>(
                find.byType(_AnimationWithPhysics));
        expect(state.controller.value, greaterThan(previousValue));
        previousValue = state.controller.value;
      }
    });
  });
}

class _AnimatingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatingWidgetState();
}

class _AnimatingWidgetState extends State<_AnimatingWidget>
    with SingleTickerProviderStateMixin {
  _AnimatingWidgetState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 16 * 10), // ten frames worth
      lowerBound: 0.0,
      upperBound: 10.0,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    );
  }

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        // Just causing the widget to rebuild when animation controller notifies
        // us that the value changed.
      });
    });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${animation.value.toInt()}', textDirection: TextDirection.ltr);
  }
}

class _AnimationWithPhysics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationWithPhysicsState();
}

class _AnimationWithPhysicsState extends State<_AnimationWithPhysics>
    with SingleTickerProviderStateMixin {
  _AnimationWithPhysicsState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 16 * 10), // ten frames worth
      lowerBound: 0.0,
      upperBound: 10.0,
    );
  }

  AnimationController controller;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        // Just causing the widget to rebuild when animation controller notifies
        // us that the value changed.
      });
    });
    controller.forward();
    controller.fling(velocity: 3.0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Text('', textDirection: TextDirection.ltr);
}
