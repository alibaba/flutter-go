//
// Created with Android Studio.
// User: 三帆
// Date: 25/05/2019
// Time: 21:46
// email: sanfan.hx@alibaba-inc.com
// tartget:  xxx
//

import 'package:flutter/material.dart';
import '../../components/widget_demo.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../standard_pages/index.dart';
import '../../page_demo_package/index.dart';

// ONLINE || LOCAL
const Env = 'LOCAL' ;

class StandardView extends StatefulWidget {
  final String id;
  final String detailMd;
  StandardView({this.id, this.detailMd});
  @override
  _StandardView createState() => _StandardView();
}


class _StandardView extends State<StandardView> {
  String markdownDesc = '# this is header';
  StandardPages standardPage = new StandardPages();
  @override
  void initState() {

    super.initState();
    this.getContent();
  }

  String _getContentFromLocal() {

    String pageId = widget.id;
    Map<String, String> pagesList = standardPage.getPages();
    return pagesList[pageId];
  }
  Future<String> _getContentOnline() async {
    String content = 'online content';

    return Future(() => content);
  }

  Future<String> getContent() async {
    String conent = '';
    if (Env == 'PRODUCTION') {
      conent = await _getContentOnline();
    } else {
      conent = _getContentFromLocal();
    }
    setState(() {
      markdownDesc = conent;
    });
    return Future(() => conent);
//    this.rebuild();
  }
  Widget buildMarkdown() {
    Map<String, String> contentList = new StandardPages().getPages();

    if (contentList[widget.id] == null) {
      contentList[widget.id] = '';
    }

    return MarkdownBody(
        data: contentList[widget.id],
        demoBuilder: (Map<String, dynamic> attrs) {
          List<Widget> demo = demoObjects[attrs['id']];
          if (demo == null) {
            demo = [
              Text("none")
            ];
          }
          print(" demoObjects[attrs['id']]: ${ demoObjects[attrs['id']]}");
          return Column(
            children: demo
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new WidgetDemo(
      title: 'title',
      codeUrl: 'elements/Form/Button/DropdownButton/demo.dart',
      contentList: [
        buildMarkdown()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/DropdownButton-class.html',
    );
  }
}