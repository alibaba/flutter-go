/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-17 15:37:16 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-17 15:50:02
 */
import 'package:flutter/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String content0 = '''
### **简介**
> 显示给定月份的日期，并可以选择一天
- 该选择器widget很少使用，相反，请考虑使用showDatePicker,它会创建一个日期选择器对话框
''';
const String content1 = '''
### **基本用法**
- currentDate,设置显示器当前显示时间
- displayedMonth ,设置选择器显示天数的月份
- firstDate,设置选择的最早日期
- lastDate,设置可选择的最晚日期
- selectedDate，设置当前选择的日期
''';

class Demo extends StatefulWidget {
  static const String routeName = '/components/Pick/DayPicker';

  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
        contentList: [content0, content1, DayPickerDemo()],
        codeUrl: 'components/Pick/DayPicker/demo.dart',
        docUrl: "https://docs.flutter.io/flutter/material/DayPicker-class.html",
        title: 'DayPicker');
  }
}
