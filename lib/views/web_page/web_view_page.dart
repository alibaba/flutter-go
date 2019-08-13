/// @Author: 一凨
/// @Date: 2019-01-14 17:44:47
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 19:47:14

import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter_go/model/collection.dart';
import 'package:flutter_go/event/event_bus.dart';
import 'package:flutter_go/event/event_model.dart';
import 'package:flutter_go/api/api.dart';
import 'package:flutter_go/routers/application.dart' show Application;

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    dialog = dialogContext(false);

    flutterWebviewPlugin.onUrlChanged.listen((String url) {

      print('url change:$url');
      if (url.indexOf('loginSuccess') > -1) {
        String urlQuery = url.substring(url.indexOf('?') + 1);
        String loginName, token;
        List<String> queryList = urlQuery.split('&');
        for (int i = 0; i < queryList.length; i++) {
          String queryNote = queryList[i];
          int eqIndex = queryNote.indexOf('=');
          if (queryNote.substring(0, eqIndex) == 'loginName') {
            loginName = queryNote.substring(eqIndex + 1);
          }
          if (queryNote.substring(0, eqIndex) == 'accessToken') {
            token = queryNote.substring(eqIndex + 1);
          }
        }
        if (ApplicationEvent.event != null) {
          ApplicationEvent.event
              .fire(UserGithubOAuthEvent(loginName, token, true));
        }
        print('ready close');

        flutterWebviewPlugin.close();
        // 验证成功
      } else if (url.indexOf('${Api.BASE_URL}loginFail') == 0) {
        // 验证失败
        if (ApplicationEvent.event != null) {
          ApplicationEvent.event.fire(UserGithubOAuthEvent('', '', true));
        }
        flutterWebviewPlugin.close();
      }
    });
    flutterWebviewPlugin.onStateChanged.listen((state) async {
      print('url state:$state');
      if(state.type == WebViewState.finishLoad) {
      }
    });
  }

  Widget dialogContext(bool isShow){
    if(!isShow){
      return Container(child:Text(""));
    }
    return Container(
        height: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('分享到',style: TextStyle(fontSize:16,color: Colors.deepOrange)),
                    FlatButton(
                        child: Text('取消',style: TextStyle(fontSize:16,color: Colors.black45),),
                        onPressed: (){
                          setState(() {
                            dialog = dialogContext(false);

                          });
                        }
                    )
                  ]
              )
            ])
    );
  }

  Container dialog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.announcement),
//              onPressed: () {
//                /// flutterWebviewPlugin.evalJavascript("alert('Flutter Go H5 版本')");
//                setState(() {
//                  dialog = dialogContext(true);
//                });
//              },
//            )
//          ],
        ),
        body: WebviewScaffold(
          url: widget.url,
          withZoom: true,
          withLocalStorage: true,
          withJavascript: true,
          userAgent: "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36",
          bottomNavigationBar:dialog,
          initialChild: Container(
            color: Colors.white,
            child: const Center(
              child: Text("Loading...."),
            ),
          ),
        ));

  }
}
