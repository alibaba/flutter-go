import 'package:flutter/material.dart';
import 'package:flutter_go/utils/high_light_code.dart';

import '../components/flutter_markdown/lib/flutter_markdown.dart' as md;

/// 使用方法
/// MarkdownBody(markdown)
final hightlighter = HighLight();

class HighLight extends md.SyntaxHighlighter {
  @override
  TextSpan format(String source) {
    final SyntaxHighlighterStyle style =
        SyntaxHighlighterStyle.lightThemeStyle();
    return TextSpan(
        style: const TextStyle(fontSize: 10.0),
        children: <TextSpan>[DartSyntaxHighlighter(style).format(source)]);
  }
}

class MarkdownBody extends StatelessWidget {
  final String data;
  MarkdownBody(this.data);
  @override
  Widget build(BuildContext context) {
    return md.MarkdownBody(data: data, syntaxHighlighter: HighLight());
  }
}
