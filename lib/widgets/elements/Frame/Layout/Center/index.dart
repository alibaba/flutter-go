import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const String Text0 = """### **简介**
> 一个将child 放置于中心
- 如果它的尺寸受到外界约束，并且widthFactor和heightFactor 为null，则widget将会尽可能的大。
- 如果它的尺寸不受外界约束，并且相应的大小为null，则widget将会匹配child widget的大小
- 如果相应尺寸不为null，则widget的相应尺寸将是child 尺寸和尺寸因子的乘积（例如：widthFactor是2.0,那么widget的宽度始终是其child widget宽度的2倍）
""";

const String Text1 = """
### **基本用法**
> widthFacto/heightFactor 非null，将其宽/高度设置为子宽/高度乘以此系数
- 如果widthFactor是2.0，那么widget的宽度将始终是其子宽度的两倍。
- 如果heightFactor是2.0，那么widget的高度将始终是其子高度的两倍。

""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Frame/Layout/Center';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Center',
      codeUrl: 'elements/Frame/Layout/Center/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/widgets/Column-class.html',
      contentList: [
        Text0,
        Text1,
        CenterDemo(),
      ],
    );
  }
}
