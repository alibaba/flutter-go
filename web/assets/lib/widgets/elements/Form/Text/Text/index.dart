import 'package:flutter_web/material.dart';
import 'package:flutter_go/components/widget_demo.dart';
import 'demo.dart';

const String intro = """
### **简介**

> 具有某个单一样式的文本显示的widget组件, 显示支持一行或者多行. 默认样式会继承层级最为接近的 *DefaultStyle* 
当然, 你也可以重新他的样式 将 *DefaultStyle.inherit 设置为 false*

是最基本的文本显示组件

### **基本用法**
在这里介绍一下他的基本属性说明.

- data	Text显示的文本，必填参数	String
- textAlign	文本的对齐方式,可以选择左对齐、右对齐还是居中对齐	TextAlign
- maxLines	文本显示的最大行数	int
- overflow	文本显示的截断方式	TextOverflow
- textScaleFactor	文本的缩放比例	double
- style	用于指定文本显示的样式如颜色、字体、粗细、背景等


### **基本示例**

""";

class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Text/Text';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  onButtonTap() {

  }
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: "Text",
      docUrl: 'flutter/widgets/Text-class.html',
      codeUrl: 'elements/Form/Text/Text/demo.dart',
      contentList: [
        intro,
        TextDemo(),
      ]
    );
  }
}
