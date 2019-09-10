/// @Author: 一凨 
/// @Date: 2019-01-14 11:42:32 
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 14:42:00

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_go/utils/example_code_parser.dart';
import 'package:flutter_go/utils/syntax_highlighter.dart';
import 'package:flutter_go/utils/net_utils.dart';

class FullScreenCodeDialog extends StatefulWidget {
  const FullScreenCodeDialog({this.filePath, this.remoteFilePath});

  final String filePath;
  final String remoteFilePath;
  _FullScreenCodeDialogState createState() => _FullScreenCodeDialogState();
}

class _FullScreenCodeDialogState extends State<FullScreenCodeDialog> {
  String _exampleCode;

  @override
  void didChangeDependencies() {
    print('widget.filePath=======${widget.filePath}');
    if (widget.filePath != null) {
      getExampleCode(context,'${widget.filePath}', DefaultAssetBundle.of(context))
          .then<void>((String code) {
        if (mounted) {
          setState(() {
            _exampleCode = code ?? 'Example code not found';
          });
        }
      });
    }
    if (widget.remoteFilePath != null) {
      getRemotePathCode(widget.remoteFilePath);
    }

    super.didChangeDependencies();
  }

  getRemotePathCode(path) async {
    String response = await NetUtils.get(path);
    if (mounted) {
      setState(() {
        _exampleCode = response ?? 'Example code not found';
      });
    }
  }

  void showCopySuccess(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('复制成功！'),
                RaisedButton(
                  child: Text('确定'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      }
    );
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
      try{
        DartSyntaxHighlighter(style).format(_exampleCode);
        _codeWidget = RichText(
          text: TextSpan(
                style: const TextStyle(fontFamily: 'monospace', fontSize: 10.0),
                children: <TextSpan>[
                  DartSyntaxHighlighter(style).format(_exampleCode)
                ],),
        );
      }catch (err){
        _codeWidget = Text(_exampleCode);
      }
      body = SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _codeWidget,
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
        body: GestureDetector(
          child: body,
          onLongPress: () {
            Clipboard.setData(new ClipboardData(text: _exampleCode)).then((value) {
              showCopySuccess(context);
            });
          },
        )
    );
  }
}
