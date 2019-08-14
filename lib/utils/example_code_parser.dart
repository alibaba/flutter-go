/// @Author: 一凨 
/// @Date: 2019-01-14 11:42:36 
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 16:53:11

import 'dart:async';

import 'package:flutter_web/services.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_go/routers/application.dart';

Map<String, String> _exampleCode;
String _code;

void _launchURL(String url) async {
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
}

Future<String> getExampleCode(context,String filePath, AssetBundle bundle) async {
  if (_exampleCode == null) await _parseExampleCode(context,filePath, bundle);
  return _code;
}

Future<void> _parseExampleCode(context,String filePath, AssetBundle bundle) async {
  String code;
  try {
    code = await bundle.loadString('lib/widgets/$filePath');
    /// code = await bundle.loadString('https://github.com/alibaba/flutter-go/tree/master/lib/widgets/$filePath');
  } catch (err) {
    Navigator.of(context).pop();
    _launchURL(Application.github['widgetsURL'] + filePath);
  }
  print('***************');
  print('lib/widgets/$filePath');
  print('***************');
  _code = code;
}
