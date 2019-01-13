import 'package:flutter/material.dart';
//import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../../common/widget_demo.dart';
import '../../../../../components/markdown.dart';

const String intro = """
# 说明

> 具有某个单一样式的文本显示的widget组件, 显示支持一行或者多行. 默认样式会继承层级最为接近的 *DefaultStyle* 
当然, 你也可以重新他的样式 将 *DefaultStyle.inherit 设置为 false*

# 示例代码

``` dart
Text(
  'Hello, World ! How are you?',
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontWeight: FontWeight.bold),
)
```

# 示例显示


""";

const String leftDesc = """
# 示例代码


``` dart
// 左侧布局示例
Text(
  "Hello, World! I'm start from left?",
  textAlign: TextAlign.left,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontWeight: FontWeight.bold, inherit: true),
),
```
# 示例显示
""";

const String RichDesc = """

# 复杂文本显示

使用 Text.rich 构造函数，Text 组件可以显示具有不同样式的 TextSpan 段落。下面的示例显示每个单词具有不同样式的“Hello beautiful world”。

```
Text.rich(
  TextSpan(
    text: 'Hello', // default text style
    children: <TextSpan>[
      TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
)
```
""";

const Map<String, String> markDesc = {
  "intro": intro,
  "left": leftDesc,
  "rich": RichDesc
};
class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Text/Text';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {
  onButtonTap() {

  }
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: "Text",
      docUrl: 'flutter/widgets/Text-class.html',
      codeUrl: 'elements/Form/Text/Text/index.dart',
      contentList: [new Column(
        children: <Widget>[
          MarkdownBody(markDesc['intro']),
          Text(
            'Hello, World! How are you?',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          MarkdownBody(markDesc['left']),
          Container(
            width: 750.0,
            color: Color(0xFF0096ef),
            child: Text(
              "Hello, World! I'm start from left?",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color(0xffffffff)),
            ),
          ),
          MarkdownBody( markDesc['rich']),
          Text.rich(
            TextSpan(
              text: 'Hello', // default text style
              children: <TextSpan>[
                TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      )]
    );
  }
}
