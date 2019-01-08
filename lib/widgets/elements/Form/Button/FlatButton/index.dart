/**
 * Created with 菜鸟手册.
 * User: 一晟
 * Date: 2018/11/14
 * Time: 下午4:31
 * email: zhu.yan@alibaba-inc.com
 * target: FlatButton 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/FlatButton-class.html
 */
import '../../../../../common/widget-demo.dart';
import '../../../../../routers/application.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart' as flatButton;

const String _markdownData = """# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted Dart code in your app.
## Styling
Style text as _italic_, __bold__, or `inline code`.
- Use bulleted lists
- To better clarify
- Your points
## Links
You can use [hyperlinks](hyperlink) in markdown
## Images
You can include images:
![Flutter logo](https://flutter.io/images/flutter-mark-square-100.png#100x100)
## Markdown widget
This is an example of how to create your own Markdown widget:
    new Markdown(data: 'Hello _world_!');
## Code blocks
Formatted Dart code looks really pretty too:
```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```
Enjoy!
""";


const String _flatText0 =
"""### **简介**
> Flat button 是显示在（零高程）material widget上的文本标签
- 通过填充颜色对触摸作出反应在工具栏上，
- 在对话框中使用Flat button，或与其他内容内联，但使用填充从该内容偏移，以便按钮的存在是显而易见的。
- Flat buttons 故意不具有可见边框，因此必须依赖于它们相对于其他内容的位置以用于上下文。
- 在对话框和卡片中，它们应该组合在一个底角中。避免使用平面按钮，它们会与其他内容混合，例如在列表中间。""";

const String _flatText1 =
"""### **基本用法**
> 参数的默认的按钮和禁用按钮
- 如果onPressed回调为null，则该按钮将被禁用，不会对触摸做出反应，并且将按 disabledColor 属性而不是color属性指定的颜色进行着色。
- 如果您尝试更改按钮的颜色并且没有任何效果，请检查您是否正在传递非null onPressed处理程序。""";


const String _flatText2 =
"""### **进阶用法1**
> FlatButton.icon，按钮图标和标签的widget创建文本按钮。""";

const String _flatText3 =
"""### **进阶用法2**
> 更改项参数的自定义,比如:边框，点击效果，内容文字颜色等
- Material design Flat buttons 按钮具有全帽标签，一些内部填充和一些定义的尺寸。
- 要使应用程序的一部分具有交互式，使用墨水溅，而不是承诺这些样式选择，请考虑使用InkWell。
- Flat button 的最小尺寸为88.0×36.0，可以用 ButtonTheme 覆盖。该clipBehavior参数不能为空。""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Button/FlatButton';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'FlatButton',
      codeUrl: '${Application.github['widgetsURL']}elements/Form/Button/FlatButton/demo.dart',
      child: allFlatButtons(context),
      docUrl: 'https://docs.flutter.io/flutter/material/FlatButton-class.html',
    );
  }
}

/**
 * 所有的 FlatButton 按钮
 */
Widget allFlatButtons(BuildContext context){
  return Container(
      //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _flatText0),
            textAlignBar(_flatText1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                flatButton.FlatButtonDefault(),
                SizedBox(width: 20.0), // 间距
                flatButton.FlatButtonDefault(false),
              ],
            ),
            textAlignBar(_flatText2),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                flatButton.FlatButtonIconDefault(),
                flatButton.FlatButtonIconDefault(false),
              ],
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                flatButton.FlatButtonIconDefault(true, Icons.android),
                flatButton.FlatButtonIconDefault(true, Icons.announcement),
              ],
            ),
            textAlignBar(_flatText3),
            //flatButton.FlatButtonCustom(context,'主要按钮',Colors.blue),
            flatButton.FlatButtonCustom('主要按钮',Colors.blue),
            SizedBox(height: 10.0),
            flatButton.FlatButtonCustom('成功按钮',Colors.green),
            SizedBox(height: 10.0),
            flatButton.FlatButtonCustom('信息按钮',Colors.grey),
            SizedBox(height: 10.0),
            flatButton.FlatButtonCustom('警告按钮',Colors.orange),
            SizedBox(height: 10.0),
            flatButton.FlatButtonCustom('危险按钮',Colors.pink),
            SizedBox(height: 10.0),
            flatButton.FlatButtonCustom('点击我试试！', Colors.red,
                new Border.all(color: Colors.brown, width: 5.0, style: BorderStyle.solid),
                    () => _showMessage('点击了 FLAT BUTTON ', context)),
            SizedBox(height: 20.0)
          ])
  );
}

/*
  * alert 弹框
  * context:容器的父级
  * */
void _showMessage(String name, BuildContext context) {
  showDialog(
    // alert 的父级
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: new Text('提示'),
          content: new Text(name),
          actions: <Widget>[
            new FlatButton(
              // alert 的取消按钮
                onPressed: () {
                  // 取消的事件
                  Navigator.of(context).pop(true);
                },
                child: new Text('取消'))
          ]);
    }
  );
}

/*
* 带align的text
* */
Widget textAlignBar(String txt){
  //style: new TextStyle(fontSize: 15.5, height: 1.2),textAlign:TextAlign.left
  return new Align(
    alignment: FractionalOffset.centerLeft,
    child: Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        MarkdownBody(data: txt)
        //new Text(txt, style: new TextStyle(fontSize: 15.5,height: 1.2,color:Colors.blue),textAlign:TextAlign.left)
      ])
  );
}
