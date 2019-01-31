import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';
const Text0 = '''
### **简介**
> CupertinoScrollbar 是ios样式风格的滚动条

为其可滚动的子元素,构建一个ios风格样式的滚动条
''';

const String Text1 = """
### **基本用法**
> 这里我们会用一个有CupertinoScrollbar和无CupertinoScrollbar的demo进行对比展示, 
通过对比, 我们发现CupertinoScrollbar的子组件, 会有滚动的时候, 右侧会有一个滚动条.
""";

class Demo extends StatefulWidget {
  static const String routeName =
      '/element/themes/Cupertino/CupertinoScrollbar';

  @override
  State<StatefulWidget> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'CupertinoScrollbar',
      codeUrl: 'themes/Cupertino/CupertinoScrollbar/demo.dart',
      docUrl: 'https://docs.flutter.io/flutter/material/MaterialAccentColor-class.html',
      contentList: [
        Text0,
        Text1,
        CupertinoScrollbarDemo(),
        NoCupertinoScrollbarDemo(),
        SizedBox(height: 100),
      ],
    );
  }
}
