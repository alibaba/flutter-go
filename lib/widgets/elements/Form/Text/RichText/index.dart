import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../../common/widget_demo.dart';
import 'demo.dart';
const String intro = """
# 富文本显示

在富文本使用多个不同风格的widget显示文本。要显示的文本使用TextSpan对象树来描述，每个对象都有一个用于该子树的关联样式。文本可能会跨越多行，也可能全部显示在同一行上，具体取决于布局约束。

# 示例代码

```
RichText(
  text: TextSpan(
    text: 'Hello ',
    style: DefaultTextStyle.of(context).style,
    children: <TextSpan>[
      TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: ' world!'),
    ],
  ),
)
```

# 示例示例

""";
const String diff = """
# RichText 与 Text.rich 对比

无论是Text或者Text.rich, 查看源代码发现. 都是由RichText构建出来

## 源码展示

```
// Text 源码
@override
  Widget build(BuildContext context) {
      ...
      Widget result = RichText(
      ...
    
        style: effectiveTextStyle,
        text: data,
        children: textSpan != null ? <TextSpan>[textSpan] : null,
      ),
    );
    ...
    return result;
  }
```
待补充...
""";
const Map<String, String> markDesc = {
  'intro': intro,
  'diff': diff
};
class Demo extends StatefulWidget {
  static const String routeName = '/element/Form/Text/RichText';
  _Demo createState() => _Demo();
}

class _Demo extends State<Demo> {

  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'Rich Text',
      docUrl: 'https://docs.flutter.io/flutter/widgets/RichText-class.html',
      codeUrl: '',
      contentList: [new Column(
        children: <Widget>[
          MarkdownBody(data: markDesc['intro']),
          Demo(),
          MarkdownBody(data: markDesc['diff']),
        ],
      ),
    ]);
  }
}
