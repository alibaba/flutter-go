// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:matcher/matcher.dart' as matcher;

import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'package:flutter_web_test/flutter_web_test.dart';

main() {
  group('Tree', () {
    testWidgets('handles changing widget types', (WidgetTester tester) async {
      final widget = _TypeChangingWidget();
      await tester.pumpWidget(widget);
      expect(find.text('typeA'), findsOneWidget);

      _TypeChangingWidgetState state =
          tester.state(find.byType(_TypeChangingWidget));
      state.doSwitchType();
      await tester.pump();
      expect(find.text('typeB'), findsOneWidget);
    });
  });

  group('SingleChildParent', () {
    testWidgets('handles changing widget types', (WidgetTester tester) async {
      final widget = _TypeChangingWidget();
      final singleChildParent = _TestSingleChildParentLike(child: widget);
      await tester.pumpWidget(singleChildParent);
      expect(find.text('typeA'), findsOneWidget);

      _TypeChangingWidgetState state =
          tester.state(find.byType(_TypeChangingWidget));
      state.doSwitchType();
      await tester.pump();
      expect(find.text('typeB'), findsOneWidget);
    });
  });

  group('text', () {
    testWidgets('renders simple text', (WidgetTester tester) async {
      await tester.pumpWidget(new _SimpleTextWidget());
      expect(find.text('hello world!'), findsOneWidget);
    });

    testWidgets('renders changing text', (WidgetTester tester) async {
      var widget = new _ChangingTextWidget();
      await tester.pumpWidget(widget);
      expect(find.text('initial'), findsOneWidget);

      // Repeated re-renders without actual change should be a noop
      await tester.pump();
      expect(find.text('initial'), findsOneWidget);

      // Now with the actual change
      widget.state.value = 'updated';
      await tester.pump();
      expect(find.text('updated'), findsOneWidget);
    });
  });

  group('MultiChildWidget', () {
    testWidgets('handles changing widget types', (WidgetTester tester) async {
      final widget = _TypeChangingWidget();
      final multiChildWidget = new _TestListLike(
        children: [widget],
      );
      await tester.pumpWidget(multiChildWidget);
      expect(find.text('typeA'), findsOneWidget);

      _TypeChangingWidgetState state =
          tester.state(find.byType(_TypeChangingWidget));
      state.doSwitchType();
      await tester.pump();
      expect(find.text('typeB'), findsOneWidget);
    });

    testWidgets('does not update if config is identical',
        (WidgetTester tester) async {
      await tester.pumpWidget(new _IdenticalConfigWidget());

      _UpdateTrackingTextElement trackingNode =
          tester.element(find.byType(_UpdateTrackingText));

      expect(trackingNode.updateCount, 0);
      await tester.pump();
      expect(trackingNode.updateCount, 0);
      await tester.pump();
      expect(trackingNode.updateCount, 0);
    });

    testWidgets('updates children if descendants need update',
        (WidgetTester tester) async {
      var widget = new _ElementWithTrackingChild();
      await tester.pumpWidget(widget);

      await tester.pump();

      Element statefulNode =
          tester.element(find.byType(_ElementWithTrackingChild));
      _UpdateTrackingTextElement trackingNode1 =
          tester.element(find.byType(_UpdateTrackingText));
      expect(trackingNode1.updateCount, 0);

      statefulNode.markNeedsBuild();
      await tester.pump();

      _UpdateTrackingTextElement trackingNode2 =
          tester.element(find.byType(_UpdateTrackingText));
      expect(trackingNode2, same(trackingNode1));
      expect(trackingNode2.updateCount, 1);
    });

    group('child list diffing', () {
      _ChildListWidgetState listState;

      setUp(() {
        listState = null;
      });

      tearDown(() {
        listState = null;
      });

      Future<void> testCreate(WidgetTester tester, List<int> keys) async {
        var widget = new _ChildListWidget();
        await tester.pumpWidget(widget);
        listState = widget.state;

        listState.setState(() {
          listState.childKeys = keys;
        });
        await tester.pump();
        var texts = find.byType(Text).evaluate();
        expect(texts.length, equals(keys.length));
        var i = 0;
        for (var textElement in texts) {
          var key = keys[i++];
          Text text = textElement.widget;
          expect(text.data, equals('$key'));
        }
      }

      Future<void> testUpdate(WidgetTester tester, List<int> keys) async {
        listState.setState(() {
          listState.childKeys = keys;
        });
        await tester.pump();
        var texts = find.byType(Text).evaluate();
        expect(texts.length, equals(keys.length));
        var i = 0;
        for (var textElement in texts) {
          var key = keys[i++];
          Text text = textElement.widget;
          expect(text.data, equals('$key'));
        }
      }

      testWidgets('appends new children added to previously empty child list',
          (WidgetTester tester) async {
        await testCreate(tester, []);
        await testUpdate(tester, [1, 2, 3]);
      });

      testWidgets(
          'appends new children added to previously non-empty child list',
          (WidgetTester tester) async {
        await testCreate(tester, [1, 2]);
        await testUpdate(tester, [1, 2, 3, 4, 5]);
      });

      testWidgets('deletes all children', (WidgetTester tester) async {
        await testCreate(tester, [1, 2]);
        await testUpdate(tester, []);
      });

      testWidgets('truncates child list', (WidgetTester tester) async {
        await testCreate(tester, [0, 1, 2, 3, 4]);
        await testUpdate(tester, [0, 1, 2]);
      });

      testWidgets('removes children in the middle',
          (WidgetTester tester) async {
        await testCreate(tester, [0, 1, 2, 3]);
        await testUpdate(tester, [0, 3]);
      });

      testWidgets('inserts children in the middle',
          (WidgetTester tester) async {
        await testCreate(tester, [1, 4]);
        await testUpdate(tester, [1, 2, 3, 4]);
      });

      testWidgets('replaces range with a longer range',
          (WidgetTester tester) async {
        await testCreate(tester, [1, 2, 3, 4, 9]);
        await testUpdate(tester, [1, 5, 6, 7, 8, 9]);
      });

      testWidgets('replaces range with a shorter range',
          (WidgetTester tester) async {
        await testCreate(tester, [1, 2, 3, 4]);
        await testUpdate(tester, [1, 10, 4]);
      });

      testWidgets('moves children', (WidgetTester tester) async {
        await testCreate(tester, [1, 2, 3, 4, 5]);
        await testUpdate(tester, [1, 4, 3, 2, 5]);
      });
    });
  });

  testWidgets('BuildContext lookup methods return the corresponding objects',
      (WidgetTester tester) async {
    _BuildContextTest widget = new _BuildContextTest();
    await tester.pumpWidget(new _TestSingleChildParentLike(
      child: widget,
    ));

    expect(widget.latestContext.widget, same(widget));
    expect(
        widget.latestContext
            .ancestorWidgetOfExactType(_TestSingleChildParentLike),
        const matcher.TypeMatcher<_TestSingleChildParentLike>());

    List<Element> ancestorElements = <Element>[];
    widget.latestContext.visitAncestorElements((Element ancestor) {
      ancestorElements.add(ancestor);
      return true;
    });
    expect(ancestorElements, [
      // The actual element
      const matcher.TypeMatcher<SingleChildRenderObjectElement>(),
      // The root element hosting the whole app
      const matcher.TypeMatcher<RenderObjectToWidgetElement<RenderBox>>(),
    ]);

    List<Element> childElements = <Element>[];
    widget.latestContext.visitChildElements((Element child) {
      childElements.add(child);
      return true;
    });
    expect(childElements, [
      const matcher.TypeMatcher<StatelessElement>(),
    ]);
  });

  group('InheritedWidget', () {
    _inheritedWidgetTests();
  });

  group(State, () {
    _stateTests();
  });
}

void _inheritedWidgetTests() {
  testWidgets('returns null if inherited widget is not in ancestor chain',
      (WidgetTester tester) async {
    SimpleInheritedWidget inheritedWidget;
    await tester.pumpWidget(new Builder(builder: (context) {
      inheritedWidget =
          context.inheritFromWidgetOfExactType(SimpleInheritedWidget);
      return new Text('hi', textDirection: TextDirection.ltr);
    }));
    expect(find.text('hi'), findsOneWidget);
    expect(inheritedWidget, isNull);
  });

  testWidgets('can be looked up via inheritFromWidgetOfExactType',
      (WidgetTester tester) async {
    await tester.pumpWidget(new SimpleInheritedWidget(
      value: 'hi',
      child: new Builder(builder: (BuildContext context) {
        SimpleInheritedWidget inheritedWidget =
            context.inheritFromWidgetOfExactType(SimpleInheritedWidget);
        return new Text(inheritedWidget.value,
            textDirection: TextDirection.ltr);
      }),
    ));
    expect(find.text('hi'), findsOneWidget);
  });

  testWidgets('should notify if and only if updateShouldNotify returns true',
      (WidgetTester tester) async {
    String value = 'hi';
    StateSetter stateSetter;
    _SimpleInheritedWidgetUsingWidget counter =
        new _SimpleInheritedWidgetUsingWidget();

    await tester
        .pumpWidget(new StatefulBuilder(builder: (context, stateSetterFn) {
      stateSetter = stateSetterFn;
      return new SimpleInheritedWidget(
        value: value,
        child: counter,
      );
    }));
    expect(find.text('hi'), findsOneWidget);
    expect(counter.count, 1);

    stateSetter(() {
      // No actual state change.
    });

    expect(find.text('hi'), findsOneWidget);
    expect(counter.count, 1);

    stateSetter(() {
      value = 'bye';
    });
    await tester.pump();

    expect(find.text('bye'), findsOneWidget);
    expect(counter.count, 2);
  });
}

void _stateTests() {
  testWidgets('should call lifecycle methods in the correct order',
      (WidgetTester tester) async {
    bool showTracker = true;
    StateSetter setStateCallback;
    final tracker = _LifecycleTracker();
    await tester.pumpWidget(StatefulBuilder(builder: (_, theSetStateCallback) {
      setStateCallback = theSetStateCallback;
      return showTracker
          ? tracker
          : Text('not showing tracker', textDirection: TextDirection.ltr);
    }));

    _LifecycleTrackerState state = tester.state(find.byType(_LifecycleTracker));
    expect(state.initStateCount, 1);
    expect(state.didChangeDependenciesCount, 1);
    expect(state.buildCount, 1);
    expect(state.deactivateCount, 0);
    expect(state.disposeCount, 0);

    Element element = state.context;
    element.markNeedsBuild();
    await tester.pump();
    expect(state.initStateCount, 1);
    expect(state.didChangeDependenciesCount, 1);
    expect(state.buildCount, 2);
    expect(state.deactivateCount, 0);
    expect(state.disposeCount, 0);

    setStateCallback(() {
      showTracker = false;
    });

    await tester.pump();
    expect(state.initStateCount, 1);
    expect(state.didChangeDependenciesCount, 1);
    expect(state.buildCount, 2);
    expect(state.deactivateCount, 1);
    expect(state.disposeCount, 1);
  });
}

class _LifecycleTracker extends StatefulWidget {
  @override
  createState() => _LifecycleTrackerState();
}

class _LifecycleTrackerState extends State<_LifecycleTracker> {
  int initStateCount = 0;
  int didChangeDependenciesCount = 0;
  int buildCount = 0;
  int deactivateCount = 0;
  int disposeCount = 0;

  @override
  void initState() {
    initStateCount++;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    didChangeDependenciesCount++;
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    deactivateCount++;
    super.deactivate();
  }

  @override
  void dispose() {
    disposeCount++;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildCount++;
    return Text('', textDirection: TextDirection.ltr);
  }
}

// This widget is mutable because it tracks context variables.
// ignore: must_be_immutable
class _BuildContextTest extends StatelessWidget {
  BuildContext latestContext;

  @override
  Widget build(BuildContext context) {
    latestContext = context;
    return const Text('A', textDirection: TextDirection.ltr);
  }
}

// This widget is intentionally mutable because it counts the number of times
// its `build` method is called.
// ignore: must_be_immutable
class _SimpleInheritedWidgetUsingWidget extends StatelessWidget {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    count++;
    SimpleInheritedWidget inheritedWidget =
        context.inheritFromWidgetOfExactType(SimpleInheritedWidget);
    return new Text(inheritedWidget.value, textDirection: TextDirection.ltr);
  }
}

class _SimpleInheritedWidgetTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SimpleInheritedWidgetTestState();
  }
}

class _SimpleInheritedWidgetTestState
    extends State<_SimpleInheritedWidgetTest> {
  String value;

  @override
  Widget build(BuildContext context) {
    return new SimpleInheritedWidget(
      value: value,
      child: new Builder(builder: (BuildContext context) {
        SimpleInheritedWidget inheritedWidget =
            context.inheritFromWidgetOfExactType(SimpleInheritedWidget);
        return new Text(inheritedWidget.value,
            textDirection: TextDirection.ltr);
      }),
    );
  }
}

class SimpleInheritedWidget extends InheritedWidget {
  SimpleInheritedWidget({this.value, Widget child}) : super(child: child);

  final String value;

  @override
  bool updateShouldNotify(SimpleInheritedWidget oldWidget) {
    return value != oldWidget.value;
  }
}

class _UpdateTrackingText extends RichText {
  _UpdateTrackingText(String text)
      : super(
          text: TextSpan(text: text),
          textDirection: TextDirection.ltr,
        );

  @override
  _UpdateTrackingTextElement createElement() =>
      new _UpdateTrackingTextElement(this);
}

class _UpdateTrackingTextElement extends LeafRenderObjectElement {
  _UpdateTrackingTextElement(_UpdateTrackingText widget) : super(widget);

  int updateCount = 0;

  @override
  void update(_UpdateTrackingText newConfig) {
    updateCount++;
    super.update(newConfig);
  }
}

class _IdenticalConfigWidget extends StatelessWidget {
  static final updateTracker = new _UpdateTrackingText('never updated');
  static final config = new _TestSingleChildParentLike(child: updateTracker);
  build(_) => config;
}

class _SimpleTextWidget extends StatelessWidget {
  Widget build(_) => new Text('hello world!', textDirection: TextDirection.ltr);
}

class _ChangingTextWidget extends StatefulWidget {
  final _ChangingTextWidgetState state = new _ChangingTextWidgetState();

  _ChangingTextWidgetState createState() => state;
}

class _ChangingTextWidgetState extends State<_ChangingTextWidget> {
  String _value = 'initial';
  set value(String newValue) {
    setState(() {
      _value = newValue;
    });
  }

  Widget build(_) => new Text(_value, textDirection: TextDirection.ltr);
}

class _NodeUpdatingWidget extends StatefulWidget {
  final _NodeUpdatingWidgetState state = new _NodeUpdatingWidgetState();
  _NodeUpdatingWidgetState createState() => state;
}

class _NodeUpdatingWidgetState extends State<_NodeUpdatingWidget> {
  String _value = 'initial';
  set value(String newValue) {
    setState(() {
      _value = newValue;
    });
  }

  Widget build(_) => new _TestSingleChildParentLike(
        child: new Text(_value, textDirection: TextDirection.ltr),
      );
}

class _ChildListWidget extends StatefulWidget {
  final _ChildListWidgetState state = new _ChildListWidgetState();

  _ChildListWidgetState createState() => state;
}

class _ChildListWidgetState extends State<_ChildListWidget> {
  List<int> _childKeys;
  set childKeys(List<int> keys) {
    _childKeys = keys;
  }

  @override
  setState(VoidCallback fn) {
    super.setState(fn);
  }

  Widget build(_) {
    if (_childKeys == null) {
      return new _TestListLike(
        children: [],
      );
    }

    return new _TestListLike(
      children: _childKeys
          .map<Widget>((key) => new Text(key.toString(),
              key: new ValueKey(key), textDirection: TextDirection.ltr))
          .toList(),
    );
  }
}

class _ElementWithTrackingChild extends StatelessWidget {
  Widget build(_) => new _UpdateTrackingText('foo');
}

/// A dummy container of a flat list of children.
class _TestListLike extends MultiChildRenderObjectWidget {
  _TestListLike({
    Key key,
    List<Widget> children,
  }) : super(
          key: key,
          children: children,
        );

  @override
  _DummyContainerRenderObject createRenderObject(BuildContext context) =>
      _DummyContainerRenderObject();
}

class _DummyParentData extends ContainerBoxParentData<RenderBox> {}

class _DummyContainerRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox,
            ContainerBoxParentData<RenderBox>>,
        RenderBoxContainerDefaultsMixin<RenderBox,
            ContainerBoxParentData<RenderBox>> {
  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _DummyParentData)
      child.parentData = _DummyParentData();
  }

  @override
  void debugAssertDoesMeetConstraints() {}

  @override
  Rect get paintBounds => null;

  @override
  void performLayout() {
    var child = firstChild;
    while (child != null) {
      child.layout(constraints);
      ContainerBoxParentData parentData = child.parentData;
      child = parentData.nextSibling;
    }
    size = constraints.biggest;
  }

  @override
  void performResize() {}

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}

class _TestSingleChildParentLike extends SingleChildRenderObjectWidget {
  _TestSingleChildParentLike({Widget child}) : super(child: child);

  @override
  _DummyRenderObject createRenderObject(BuildContext context) =>
      _DummyRenderObject();
}

class _TypeChangingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TypeChangingWidgetState();
}

class _TypeChangingWidgetState extends State<_TypeChangingWidget> {
  bool _switchType = false;

  void doSwitchType() {
    setState(() {
      _switchType = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _switchType
        ? _WidgetOfDifferentType()
        : Text('typeA', textDirection: TextDirection.ltr);
  }
}

class _WidgetOfDifferentType extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Text('typeB', textDirection: TextDirection.ltr);
}

class _DummyRenderObject extends RenderBox with RenderObjectWithChildMixin {
  @override
  void debugAssertDoesMeetConstraints() {}

  @override
  Rect get paintBounds => null;

  @override
  void performLayout() {
    if (child != null) {
      child.layout(constraints);
    }
    size = constraints.biggest;
  }

  @override
  void performResize() {}

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      context.paintChild(child, offset);
    }
  }
}
