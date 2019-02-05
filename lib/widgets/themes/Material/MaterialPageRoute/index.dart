import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import './demo.dart';

const Text0 = '''
### **简介**
> 页面跳转携带参数替换整个屏幕的页面路由。
- 对于Android，页面的进入以下方滑动向上，页面退出，以上方滑动向下方。在ios上，页面进度从右边滑入，退出相反。
- 默认情况下，当路由器被另外一个替换时，前一个路由将被保留在内存中，如果希望在不需要的时候能够释放资源，请将maintainState设置为false
''';

const String Text1 = """
### **基本用法**
> 如下图示例：

""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/themes/Material/MaterialPageRoute';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'MaterialPageRoute',
      codeUrl: 'themes/Material/MaterialPageRoute/demo.dart',
      docUrl:
          'https://docs.flutter.io/flutter/material/MaterialPageRoute-class.html',
      contentList: [
        Text0,
        Text1,
        FirstPage(),
      ],
    );
  }
}
