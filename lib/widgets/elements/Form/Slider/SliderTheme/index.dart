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
> 用来更改Slider样式的上层部件

将滑块主题应用于后代Slider小部件。

### **基本用法**

> 通过更改sliderTheme.data, 修改Slider总体样式

<<<<<<< HEAD
具体属性, 请查阅: SliderThemeData.data.
=======
基本属性参考以下代码: 

```
 SliderTheme(
  data: SliderThemeData({
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
  }),
  child: anyWidgetContain(Slider) // 用来包含slider的widget容器窗口
),

```
>>>>>>> ccb5c9e42883b23266fb95b9caf4e958d817ff48

### **基本实例**


''';


class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Slider/SliderTheme';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SliderTheme',
      codeUrl: 'elements/Form/Slider/SliderTheme/demo.dart',
      contentList: [
        contentA,
         SliderThemeDemo(),
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/SliderTheme-class.html',
    );
  }
}
