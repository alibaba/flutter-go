/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 22/11/2018
 * Time: 19:17
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  Radio相关
 */

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';
const content1 = """
# RadioListTile
> material design 风格的单选按钮附加文字label

点击文字的同时 , 将会出发 Radio的点击效果.

功能同 @Radio

# 示例显示
""";

const content2 = """
# 基本用法

``` dart
RadioListTile(
  title: const Text('title'),
  value: value,
  groupValue: groupValue,
  onChanged:onChange
)
```

""";
class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/RadioListTile/index';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content1,
        new DemoA(),
        content2
      ],
      title: 'RadioListTile',
      docUrl: 'https://docs.flutter.io/flutter/material/RadioListTile-class.html',
      codeUrl: 'elements/Form/Radio/RadioListTile/demo.dart',
    );
  }
}
