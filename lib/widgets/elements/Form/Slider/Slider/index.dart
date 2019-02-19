/// Created with Android Studio.
/// User: 三帆
/// Date: 20/12/2018
/// Time: 17:43
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import  'demo.dart';

const contentA = '''
### **简介**
> 用来选择范围性的数据

slider 用来选择连续性的或者非连续性的数据. 默认是在一段最大值最小值间做任意值的选择. 如果你想选择间隔性的值, 例如0.0到50.0间,选择10, 15,...50.0这样的值, 给divisions设定一个非空的整数5,, 去分割区间范围.

### **基本用法**

关于slider有以下的术语:

* **thumb** 滑块  用户可以水平拖拽移动的区域

* **track** 滑轨 thumb 可以滑动的线条区域

* **value indicator** 值指示器 当用户拖拽thumb的时候. 显示用户当前所选的属性值

* **active** 选中区

* **inactive** 非选中区

如果**onChanged**属性为空或者**min** .. **max**给出的范围 为空（例如如果min等于max），则将禁用滑块。

滑块小部件本身不保持任何状态State。相反，当滑块状态发生变化时，窗口小部件会调用 **onChanged** 回调。大多数使用滑块的小部件将侦听 **onChanged** 回调并使用新值重建滑块以更新滑块的视觉外观。要知道值何时开始更改，或何时更改，请设置可选回调**onChangeStart**或**onChangeEnd**。

默认情况下，滑块将尽可能宽，垂直居中。当给定无限制约束时，它将尝试使轨道宽144像素（每边有边距）并垂直收缩。

### **基本实例**

''';


const contentB = '''
### **高级用法**
> 自定义Slider 样式

如果当前Slider样式 无法满足需求, 可以通过 ** SliderTheme ** 定制复杂样式

```
 SliderTheme(
  data: SliderTheme.of(context).copyWith(
    activeTrackColor: Colors.yellowAccent,//实际进度的颜色
    inactiveTickMarkColor:Colors.black
    thumbColor: Colors.black,//滑块中心的颜色
    inactiveTrackColor:Colors.red,//默 认进度条的颜色
    valueIndicatorColor: Colors.blue,//提示进度的气派的背景色
    valueIndicatorTextStyle:  TextStyle(//提示气泡里面文字的样式
      color: Colors.white,
    ),
    inactiveTickMarkColor:Colors.blue,//divisions对进度线分割后 断续线中间间隔的颜色
    overlayColor: Colors.pink,//滑块边缘颜色
  child:  Slider()
)

```

### **基本实例**

''';

class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Slider/Slider';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Slider',
      codeUrl: 'elements/Form/Slider/Slider/demo.dart',
      contentList: [
        contentA,
        SliderDemo(),
        contentB,
        SliderThemeDemo()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/Slider-class.html',
    );
  }
}
