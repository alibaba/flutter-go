/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 20/12/2018
 * Time: 17:43
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';
import '../../../../../common/widget_demo.dart';
import  'demo.dart';

const contentA = '''
### **简介**
> SliderTheme的data修饰属性 **SliderThemeData**



### **基本用法**

> 配合SliderTheme, 修改slider组件各个部件的样式, 参照@Slider的各组件命名, 修改各部件样式

构造函数如下
````
const SliderThemeData({
  @required Color activeTrackColor,
  @required Color inactiveTrackColor,
  @required Color disabledActiveTrackColor,
  @required Color disabledInactiveTrackColor,
  @required Color activeTickMarkColor,
  @required Color inactiveTickMarkColor,
  @required Color disabledActiveTickMarkColor,
  @required Color disabledInactiveTickMarkColor,
  @required Color thumbColor,
  @required Color disabledThumbColor,
  @required Color overlayColor,
  @required Color valueIndicatorColor,
  @required SliderComponentShape thumbShape,
  @required SliderComponentShape valueIndicatorShape,
  @required ShowValueIndicator showValueIndicator,
  @required TextStyle valueIndicatorTextStyle
})

````

### **基本实例**


''';


class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Slider/SliderThemeData';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SliderThemeData',
      codeUrl: 'elements/Form/Slider/SliderThemeData/demo.dart',
      contentList: [
        contentA,
        new SliderThemeDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/SliderThemeData-class.html',
    );
  }
}
