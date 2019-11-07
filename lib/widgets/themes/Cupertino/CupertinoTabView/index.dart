import 'package:flutter/material.dart';

import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const Text0 = '''
### **简介**

> 具有自己的**Navigator**状态与历史记录的选项卡视图组件.

在使用时需要注意,该组件有自己的路由体系, 有自己的导航系统, 并且他自身内部的导航系统并不与任何父母元素共享



### **基本用法**

关于它自身的路由体系, 有以下几点需要注意几点.

- 在它的根路由映射(**'/'**), 当它有 **builder** 属性的时候, 指向**build**的界面, 非得使用**router**中定义的根目录
- 当组件未设定**builder**时, 在他的路由表 **router** 中, 一定要指定 **'/'** 跟路由, 不然会产生错误.
- 当指定 **onGenerateRoute** 属性时, 它应该返回一个回空有效的route.
- 如果所有的配置都未命中, 则会命中 **onUnknownRoute** 属性. 这与MaterialApp一致相同

如果你想从 **CupertinoTabView** 的路由体系, 跳转到外层的路由中, 您需要在跳转时调用 **Navigator**,并设定 **rootNavigator** 参数
```
Navigator.of(context, rootNavigator: true)
```

### **基本实例**

''';

class Demo extends StatefulWidget {
  static const String routeName = '/element/themes/Cupertino/CupertinoTabView';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoTabView',
      codeUrl: 'themes/Cupertino/CupertinoTabView/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/cupertino/CupertinoTabView-class.html',
      contentList: [Text0, CupertinoTabScaffoldDemo()],
    );
  }
}
