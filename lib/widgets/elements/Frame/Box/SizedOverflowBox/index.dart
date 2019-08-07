
 /// Author: xiaojia.dxj
 /// Date: 2019-01-08 15:55:31 
 /// Email: xiaojia.dxj@alibaba-inc.com
 /// Last Modified by:   xiaojia.dxj
 /// Last Modified time: 2019-01-08 15:55:31 
 
import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

// const String _Text = """### **SizeBox简介**
// > 常用的一个控件，设置具体尺寸。
// - sizebox设置width，height时候，强制child宽高为该设置，
// - sizebox的width，heigh为null，child自身设置
// ### **属性**
// > width：宽
// > height：高
// - ex:200*50 sizebox
// """;
const String _Text0 = """### **简介**
> 一个特定大小的窗口小部件,将其原始约束传递给其子节点,可能会溢出。
### **基本用法**
> alignment：对齐
> size： 设置部件大小
- ex:为方便看效果，现设置幕布大小为(Container)200*50。图一

- ex:图一，基础上添加一个不设置size属性的SizeOverflowBox。图二

- ex:图二，添加size属性，100*20,图三

- ex:图三，添加 alignment: Alignment.center,
""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Box/SizeOverflowBox';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SizeOverflowBox',
      codeUrl: 'elements/Frame/Box/SizedOverflowBox/demo.dart',
      contentList: [
        // _Text,
        _Text0,
        _sizedOverflowBoxCreate(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/widgets/SizedBox-class.html',
    );
  }

  Column _sizedOverflowBoxCreate() {
    return  Column(
      children: <Widget>[
        SizeBoxDefault(
          curWidth: 200.0,
          curHeight: 50.0,
        ),
        SizedBox(height: 20.0),
        Container(
          margin:  EdgeInsets.only(top: 10.0),
          color: Color(0xffd81b60),
          width: 200.0,
          height: 50.0,
        ),
        Container(
          margin:  EdgeInsets.only(top: 10.0),
          color: Color(0xffd81b60),
          alignment: Alignment.topCenter,
          width: 200.0,
          height: 50.0,
          child: SizeOverflowBoxDefault(
            text: "SizeBox",
          ),
        ),
        Container(
          margin:  EdgeInsets.only(top: 10.0),
          color: Color(0xffd81b60),
          width: 200.0,
          height: 50.0,
          child: SizeOverflowBoxDefault(
            text: "box",
            curSizeWidth: 100.0,
            curSizeHeight: 20.0,
          ),
        ),
        Container(
          margin:  EdgeInsets.only(top: 10.0),
          color: Color(0xffd81b60),
          width: 200.0,
          height: 50.0,
          alignment: Alignment.center,
          child: SizeOverflowBoxDefault(
            text: "box",
            curSizeWidth: 100.0,
            curSizeHeight: 20.0,
          ),
        ),
      ],
    );
  }
}
