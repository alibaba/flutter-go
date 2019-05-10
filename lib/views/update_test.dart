import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_go/blocs/bak/search_api.dart';
import 'dart:convert';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    super.initState();
    FlutterDownloader.registerCallback((id, status, progress) async {
      setState(() {
        _currProgress = progress;
      });
      print(
          "id:${id}===== status=======:${status}=====progress======:${progress}");
      // 当下载完成时，调用安装
      if (status == DownloadTaskStatus.complete) {

        OpenFile.open(_localPath);
        FlutterDownloader.open(taskId: id);

      }
    });
    _permissisonReady = false;
    _prepare();
  }

  bool _isLoading;
  bool _permissisonReady;
  String _localPath;
  int _currProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          height: 10.0,
          child: new LinearProgressIndicator(
            value: _currProgress / 100,
            backgroundColor: Colors.red,
          ),
        ),
        Center(
          child: Text("现在是1.0.0",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
        ),
        Center(
          child: FlatButton(
            onPressed: () {
              print("点击${_permissisonReady}");
              if (_permissisonReady) {
                _requestDownload();
              } else {
                _checkPermission().then((hasGranted) {
                  setState(() {
                    _permissisonReady = hasGranted;
                  });
                });
              }
            },
            child: Text(
              "点击获取新版本",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red[800],
          ),
        ),
      ],
    );
  }

  Future<Null> _prepare() async {
    _permissisonReady = await _checkPermission();
  }

  //检查权限
  Future<bool> _checkPermission() async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        Map<PermissionGroup, PermissionStatus> permissions =
            await PermissionHandler()
                .requestPermissions([PermissionGroup.storage]);
        if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  void _requestDownload() async {
    final path = await _apkLocalPath;
    final taskId = await FlutterDownloader.enqueue(
      url: 'https://github.com/alibaba/flutter-go/raw/master/FlutterGo.apk',
      savedDir: path,
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
  }

  Future _findLocalPath() async {
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // 获取安装地址
  Future<String> get _apkLocalPath async {
    final directory = await getExternalStorageDirectory();
    _localPath = directory.path.toString();
    return _localPath;
  }
}
