/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 28/12/2018
 * Time: 19:54
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const contentA = '''
### **简介**
> 一个在新旧组件. 做渐变切换的组件. 有一定的动画效果

*注意*: 
- 如果你切换的足够快.超过了间隔时间, 组件只会隐藏第一个 .并渐渐显示最后一个生效的组件.
- 如果你变更的组件.只是同一个组件, 不同的state或者不同的显示数据与状态. 请为当前组件每一个状态加入一个Key. 强制生效动画效果.



### **基本实例**

''';


class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Switch/AnimatedSwitcher';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SwitchListTile',
      codeUrl: 'elements/Form/Switch/AnimatedSwitcher/demo.dart',
      contentList: [
        contentA,
        new AnimatedSwitcherDemo()
      ],
      docUrl: '',
    );
  }
}
