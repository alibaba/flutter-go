import 'package:flutter/material.dart';
import 'package:flutter_go/common/widget_demo.dart';
import 'package:flutter_go/widgets/themes/Material/MaterialColor/demo.dart';
import 'demo.dart';
const Text0 = '''
### **简介**
> 用来定义单一的强调色，以及四种色调的色系
''';

const String Text1 = """
### **基本用法**
> 这里我们配合Icon来进行演示
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
      codeUrl: 'elements/themes/Material/MaterialAccentColor',
      docUrl:
          'https://docs.flutter.io/flutter/material/MaterialAccentColor-class.html',
      contentList: [
        Text0,
        CupertinoScrollbarDemo(),
      ],
    );
  }
}
