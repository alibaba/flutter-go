/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-17 15:37:16 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-17 16:00:07
 */
import 'package:flutter/material.dart';
import '../../../../common/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 运行选择一年的可滚动年份列表
- 年份选择器widget很少使用，相反，请考虑使用showDatePicker,它会创建一个日期选择器对话框
''';
const String content1 = '''
### **基本用法**
- 使用firstData,设置用户选择的最早日期
- 使用lastData,设置用户可选择的最晚日期
- 使用selectedDate，设置当前选择的日期
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Pick/YearPicker';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [content0, content1, YearPickerDemo()],
        codeUrl: 'components/Pick/YearPicker/demo.dart',
        docUrl:
            'https://docs.flutter.io/flutter/material/YearPicker-class.html',
        title: 'YearPicker');
  }
}
