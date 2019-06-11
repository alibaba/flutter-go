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
import 'dart:convert';
import '../../components/markdown.dart' as mdCopy;
import '../../components/flutter_markdown/lib/flutter_markdown.dart';
import '../../standard_pages/index.dart';
import '../../page_demo_package/index.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'package:flutter_go/routers/application.dart';

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
  String pageTitle = "XXX";
  String author = '';
  String email = '';
  StandardPages standardPage = new StandardPages();
  @override
  void initState() {

    super.initState();
    getPagesInfo();
    this.getContent();
  }


  Future<void> getPagesInfo() async {
    String jsonString = await DefaultAssetBundle.of(context).loadString('lib/standard_pages/.pages.json');
    List jsonList = json.decode(jsonString);
    Map<String, dynamic> pageDetail = jsonList.firstWhere((item) => item['id'] == widget.id);
    if (pageDetail != null) {
      setState(() {
        pageTitle = pageDetail['title'] ?? '请加入title';
        author = pageDetail['author'];
        email = pageDetail['email'];
      });
    }

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
        syntaxHighlighter:new mdCopy.HighLight(),
        demoBuilder: (Map<String, dynamic> attrs) {
          List<Widget> demo = demoObjects[attrs['id']];
          if (demo == null) {
            String errString = "not found ${attrs['id']} in demo packages";
            debugPrint(errString);
            demo = [
              Text(errString)
            ];
          }

          return Column(
            children: demo
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return new WidgetDemo(
      title: pageTitle,
      codeUrl: 'elements/Form/Button/DropdownButton/demo.dart',
      contentList: [
        buildMarkdown(),
        SizedBox(height: 30),
        '创建者: $author',
        '创建者: $email',
        'id: ${widget.id}',
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/DropdownButton-class.html',
    );
  }
}