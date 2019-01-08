/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 22/11/2018
 * Time: 19:17
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  Radio相关
 */

import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'demo.dart';
const content1 = """
# Radio
> material design 风格的单选按钮

Radio widget 代表表单中的单选按钮, 当groupValue = value时代表组件被选中。

在表单中, 单选按钮是表示一组互斥选项按钮中的一个。当一个按钮被选中，之前选中的按钮就变为非选中的。

# 示例显示
""";

const content2 = """
# 基本用法

```
new Radio(
    value: value,
    groupValue: groupValue, //当value和groupValue一致的时候则选中
    onChanged: (T){
      onChange(T);
    }

````
""";
class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Radio/index';
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      contentList: [
        content1,
        new RadioADemo(),
        content2
      ],
      title: 'Radio',
      docUrl: 'https://docs.flutter.io/flutter/material/Radio-class.html',
      codeUrl: 'elements/Form/Radio/Radio/index.dart',
    );
  }
}
