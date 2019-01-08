/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/12/27
 * Time: 下午10:12
 * email: zhu.yan@alibaba-inc.com
 * tartget: FlatButton 的示例
 */
import '../../../common/widget-demo.dart';
import 'package:flutter/material.dart';

class CustomDemo extends WidgetDemo {

  final Widget child;
  final String docUrl;
  final String title;
  final String codeUrl;
  final Widget bottomNaviBar;
  CustomDemo(
      {Key key,
        @required this.title,
        @required this.child,
        @required this.codeUrl,
        @required this.docUrl,
        this.bottomNaviBar
      })
      : super(key: key);

  @override
  Widget build(BuildContext context,[bottomNavigationBar]) {
    print('bottomNavigationBar:${bottomNaviBar}');
    final factory = super.build(context,bottomNaviBar);
    return factory;
  }
}