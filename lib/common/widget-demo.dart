import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetDemo extends StatelessWidget {
  final Widget child;
  final String docUrl;
  final String title;
  final String codeUrl;

  WidgetDemo(
      {Key key,
      @required this.title,
      @required this.child,
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

  @override
  Widget build(BuildContext context,[bottomNaviBar]) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(title),
        actions: <Widget>[
          new IconButton(
            tooltip: 'widget doc',
            onPressed: (){
              _launchURL(docUrl);
            },
            icon: Icon(Icons.library_books),
          ),
          new IconButton(
            tooltip: 'github code',
            onPressed: (){
              _launchURL(codeUrl);
            },
            icon: Icon(Icons.code),
          ),
          new IconButton(
            tooltip: 'goBack home',
            onPressed: (){
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: new Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  child,
                ],
              ),
            ])
        ),
      bottomNavigationBar: (bottomNaviBar is Widget)?bottomNaviBar:null
      );
  }
}
