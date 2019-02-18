/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:26
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */
import 'package:flutter_go/components/widget_demo.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> GridView在移动端上非常的常见的滚动列表,  会占满给出的空间区域.


### **基本用法**

> 创建一个列表

属性介绍

- scrollDirection：滚动的方向，有垂直和水平两种，默认为垂直方向（Axis.vertical）。

- reverse：默认是从上或者左向下或者右滚动的，这个属性控制是否反向，默认值为false，不反向滚动。

- controller：控制child滚动时候的位置。

- primary：是否是与父节点的PrimaryScrollController所关联的主滚动视图。

- physics：滚动的视图如何响应用户的输入。

- shrinkWrap：滚动方向的滚动视图内容是否应该由正在查看的内容所决定。

- padding：四周的空白区域。

- gridDelegate：控制GridView中子节点布局的delegate。

- cacheExtent：缓存区域。

### **进阶用法**

> GridView 提供其他四种构造方法

- GridView.builder
- GridView.custom
- GridView.count
- GridView.extent
""";



class Demo extends StatefulWidget {
  static const String routeName = '/components/Grid/GridView';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'GridView',
      codeUrl: 'components/Grid/GridView/demo.dart',
      contentList: [
        _Text0,
        GridTileDemo(),
        SizedBox(
          height: 100.0,
        )
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/GridView-class.html',
    );
  }
}
