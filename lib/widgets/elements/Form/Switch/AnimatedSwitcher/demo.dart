 /// Created with Android Studio.
 /// User: 三帆
 /// Date: 28/12/2018
 /// Time: 19:58
 /// email: sanfan.hx@alibaba-inc.com
 /// target:  xxx

import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({Key key}) : super(key: key);

  @override
  _ClickCounterState createState() => _ClickCounterState();
}

class _ClickCounterState extends State<AnimatedSwitcherDemo> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '$_count',
            // This key causes the AnimatedSwitcher to interpret this as a "new"
            // child each time the count changes, so that it will begin its animation
            // when the count changes.
            key: ValueKey<int>(_count),
            style: Theme.of(context).textTheme.display4,
          ),
        ),
        RaisedButton(
          child: const Text('Increment'),
          onPressed: () {
            setState(() {
              _count += 1;
            });
          },
        ),
      ],
    );
  }
}