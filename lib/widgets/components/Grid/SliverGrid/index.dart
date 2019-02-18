/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 07/01/2019
 * Time: 10:26
 * email: sanfan.hx@alibaba-inc.com
 * target:  xxx
 */
import 'package:flutter_go/components/widget_demo.dart';
import 'package:flutter/material.dart';
import 'demo.dart';

const String _Text0 = """
### **简介**
> SliverGrid 将多个item以每行二个的形式, 进行排列.

### **基本用法**

> 创建

在排列列表时，将基于现有的小部件, 延迟创建可见子项的元素、状态和呈现对象。 也就是只有视口中的元素, 才会被创建, 类似于我们网页中的懒加载.

> 销毁

当元素滚动到视图之外时，关联的元素子树、状态和渲染对象将被销毁, 进入视觉窗口的元素将以懒加载的形式进行创建。

""";



class Demo extends StatefulWidget {
  static const String routeName = '/components/Grid/SliverGrid';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'SliverGrid',
      codeUrl: 'components/Grid/SliverGrid/demo.dart',
      contentList: [
        _Text0,
        SliverGridDemo(),
        SizedBox(
          height: 100.0,
        )
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/SliverGrid-class.html',
    );
  }
}
