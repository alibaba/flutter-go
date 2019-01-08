import 'package:flutter_markdown/flutter_markdown.dart' as md;
import '../common/high_light_code.dart';
import 'package:flutter/material.dart';

/// 使用方法
/// MarkdownBody(markdown)
final hightlighter = new HighLight();
class HighLight extends md.SyntaxHighlighter {
  @override
  TextSpan format(String source) {
    // TODO: implement format
    final SyntaxHighlighterStyle style = SyntaxHighlighterStyle.lightThemeStyle();
    return TextSpan(
        style: const TextStyle(fontSize: 10.0),
        children: <TextSpan>[
          DartSyntaxHighlighter(style).format(source)
        ]
    );
  }
}



class MarkdownBody extends StatelessWidget {
  String data;
  MarkdownBody(this.data);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return md.MarkdownBody(data: data, syntaxHighlighter: new HighLight());
  }
}