/**
 * @author Nealyang
 * 
 * 新widget详情页模板
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import '../routers/application.dart';
import '../components/markdown.dart';

class WidgetDemo extends StatelessWidget {
  final List<dynamic> contentList;
  final String docUrl;
  final String title;
  final String codeUrl;

  WidgetDemo(
      {Key key,
      @required this.title,
      @required this.contentList,
      @required this.codeUrl,
      @required this.docUrl})
      : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  List<Widget> _buildContent() {
    List<Widget> _list = [
      SizedBox(
        height: 10.0,
      ),
    ];
    contentList.forEach((item) {
      if (item.runtimeType == String) {
        _list.add(MarkdownBody(item));
        _list.add(
          SizedBox(
            height: 20.0,
          ),
        );
      } else {
        _list.add(item);
      }
    });
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          new IconButton(
            tooltip: 'widget doc',
            onPressed: () {
              _launchURL(docUrl);
            },
            icon: Icon(Icons.library_books),
          ),
          new IconButton(
            tooltip: 'github code',
            onPressed: () {
              print(Application.github['widgetsURL']+codeUrl);
              _launchURL(Application.github['widgetsURL']+codeUrl);
            },
            icon: Icon(Icons.code),
          ),
          new IconButton(
            tooltip: 'goBack home',
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            Column(
              children: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }
}
