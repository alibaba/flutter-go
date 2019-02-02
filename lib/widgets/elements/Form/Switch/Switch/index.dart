/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 20/12/2018
 * Time: 17:43
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import  'demo.dart';

const contentA = '''
### **简介**
> Switch 是一个切换按钮组件，通常用于设置的选项里。


### **基本用法**
通常用于Bool值参数的设置.

''';


const contentB = '''

ios 风格的实例

如果需要ios风格下的实例, 我们可以使用**Switch**的子类**adaptive**,参数使用与Switch相同, 实例如下:

''';

const contentC = '''
### **高级用法**

当默认的样式无法满足需求时, 我们可以通过自定义各部件样式.

- activeColor[**Color**] 当按钮状态通激活态时, 按钮的背景颜色
- activeThumbImage [**ImageProvider**] 当按钮状态处于激活态时, 按钮的背景图像
- activeTrackColor  [**Color**]  当按钮状态处于激活态时, 滑轨的颜色
- inactiveThumbColor [**Color**] 当按钮处于非激活状态时, 按钮的背景颜色, 与activeColor正好状态相反
- inactiveThumbImage  [**ImageProvider**] 当按钮状态处于非激活态时, 按钮的背景图像
- inactiveTrackColor  [**Color**] 当按钮状态处于非激活态时, 滑轨的颜色

下面是自定义, 更改了以上属性的实例

''';


class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Switch/Switch';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Switch',
      codeUrl: '/elements/Form/Switch/Switch/demo.dart',
      contentList: [
        contentA,
        SwitchDemo(),
        contentB,
        SwitchHighDemo(),
        contentC,
        SwitchTypesDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/Switch-class.html',
    );
  }
}
