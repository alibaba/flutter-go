import 'package:flutter/material.dart';

class ZefyrScaffold extends StatefulWidget {
  final Widget child;

  const ZefyrScaffold({Key key, this.child}) : super(key: key);

  static ZefyrScaffoldState of(BuildContext context) {
    final _ZefyrScaffoldAccess widget =
        context.inheritFromWidgetOfExactType(_ZefyrScaffoldAccess);
    return widget.scaffold;
  }

  @override
  ZefyrScaffoldState createState() => ZefyrScaffoldState();
}

class ZefyrScaffoldState extends State<ZefyrScaffold> {
  WidgetBuilder _toolbarBuilder;

  void showToolbar(WidgetBuilder builder) {
    setState(() {
      _toolbarBuilder = builder;
    });
  }

  void hideToolbar() {
    if (_toolbarBuilder != null) {
      setState(() {
        _toolbarBuilder = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final toolbar =
        (_toolbarBuilder == null) ? Container() : _toolbarBuilder(context);
    return _ZefyrScaffoldAccess(
      scaffold: this,
      child: Column(
        children: <Widget>[
          Expanded(child: widget.child),
          toolbar,
        ],
      ),
    );
  }
}

class _ZefyrScaffoldAccess extends InheritedWidget {
  final ZefyrScaffoldState scaffold;

  _ZefyrScaffoldAccess({Widget child, this.scaffold}) : super(child: child);

  @override
  bool updateShouldNotify(_ZefyrScaffoldAccess oldWidget) {
    return oldWidget.scaffold != scaffold;
  }
}
