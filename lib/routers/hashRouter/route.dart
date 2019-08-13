import 'package:flutter_web/material.dart';

class FadeRoute extends PageRoute {
  FadeRoute({
    @required String name,
    @required this.title,
    @required this.builder,
  }) : super(settings: RouteSettings(
    name: name,
  ));

  final String title;
  final WidgetBuilder builder;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Title(
      title: this.title,
      color: Theme.of(context).primaryColor,
      child: builder(context),
    );
  }
  
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class SimpleRoute extends PageRoute {
  SimpleRoute({
    @required String name,
    @required this.title,
    @required this.builder,
  }) : super(settings: RouteSettings(
    name: name,
  ));

  final String title;
  final WidgetBuilder builder;

  @override
  Color get barrierColor => null;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    // return Title(
    //   title: this.title,
    //   color: Theme.of(context).primaryColor,
    //   child: builder(context),
    // );
    return builder(context);
  }
}