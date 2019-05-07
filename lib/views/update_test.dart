import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/blocs/bak/search_api.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text("现在是1.0.0",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              print("点击");
              _UpdatePageNet();
            },
            child: Text(
              "点击获取新版本",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red[800],
          ),
        )
      ],
    );
  }

  Future _UpdatePageNet() async {
    Response response = await dio.get("https://github.com/alibaba/flutter-go/raw/master/FlutterGo.apk");
    print("=====response============="+response.data);
  }
}
