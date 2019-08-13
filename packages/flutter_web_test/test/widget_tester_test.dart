import 'package:flutter_web/material.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

void main() {
  group('testWidgets', () {
    int counter = 0;

    testWidgets('calls the callback', (WidgetTester tester) async {
      expect(tester, isNotNull);
      counter++;
    });

    test('callback is called exactly once', () {
      expect(counter, 1);
    });

    testWidgets('renders a widget via pumpWidget', (WidgetTester tester) async {
      expect(find.text('Test starting...'), findsOneWidget);

      await tester.pumpWidget(_TestWidget());

      expect(find.text('hi'), findsOneWidget);
    });
  });

  group(WidgetTester, () {
    testWidgets('pumps frames with correct timestamps',
        (WidgetTester tester) async {
      await tester.pumpWidget(Directionality(
        textDirection: TextDirection.ltr,
        child: Text(''),
      ));

      const oneFrame = Duration(milliseconds: 16);
      final timestampLog = <Duration>[];
      final expectedLog = <Duration>[oneFrame];

      SchedulerBinding.instance.scheduleFrameCallback(timestampLog.add);
      await tester.pump(oneFrame);
      expect(timestampLog, expectedLog);

      expectedLog.add(Duration(milliseconds: 1016));
      SchedulerBinding.instance.scheduleFrameCallback(timestampLog.add);
      await tester.pump(Duration(milliseconds: 1000));
      expect(timestampLog, expectedLog);
    });
  });
}

class _TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text('hi'),
    );
  }
}
