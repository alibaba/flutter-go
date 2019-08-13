/// @Author: 一凨
/// @Date: 2019-01-14 11:42:32
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 14:42:00

import 'package:flutter_web/material.dart';

import 'package:flutter_go/utils/example_code_parser.dart';
import 'package:flutter_go/utils/syntax_highlighter.dart';

class FullScreenCodeDialog extends StatefulWidget {
  const FullScreenCodeDialog({this.filePath});

  final String filePath;
  _FullScreenCodeDialogState createState() => _FullScreenCodeDialogState();
}

class _FullScreenCodeDialogState extends State<FullScreenCodeDialog> {
  String _exampleCode;

  @override
  void didChangeDependencies() {
    print('widget.filePath=======${widget.filePath}');
    getExampleCode(
            context, '${widget.filePath}', DefaultAssetBundle.of(context))
        .then<void>((String code) {
      if (mounted) {
        print('_exampleCode=======${_exampleCode}');
        setState(() {
          _exampleCode = code ?? 'Example code not found';
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final SyntaxHighlighterStyle style =
        Theme.of(context).brightness == Brightness.dark
            ? SyntaxHighlighterStyle.darkThemeStyle()
            : SyntaxHighlighterStyle.lightThemeStyle();

    Widget body;
    if (_exampleCode == null) {
      body = const Center(child: CircularProgressIndicator());
    } else {
      Widget _codeWidget;
      try {
        DartSyntaxHighlighter(style).format(_exampleCode);
        _codeWidget = RichText(
          text: TextSpan(
            style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
            children: <TextSpan>[
              DartSyntaxHighlighter(style).format(_exampleCode)
            ],
          ),
        );
      } catch (err) {
        _codeWidget = Text(_exampleCode);
      }

      // TextEditingController controller = TextEditingController();
      // controller.addListener(() {});
      // controller.text = _exampleCode;

      body = SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _codeWidget,
          /// child: TextField(controller:controller),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.clear,
                semanticLabel: 'Close',
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text('Example code'),
        ),
        body: body);
  }
}
