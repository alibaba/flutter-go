/// @Author: 一凨 
/// @Date: 2019-01-14 11:42:36 
/// @Last Modified by: 一凨
/// @Last Modified time: 2019-01-14 16:53:11

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'package:flutter_go/routers/application.dart';


Map<String, String> _exampleCode;
String _code;

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<String> getExampleCode(context,String filePath, AssetBundle bundle) async {
  if (_exampleCode == null) await _parseExampleCode(context,filePath, bundle);
  return _code;
}

Future<void> _parseExampleCode(context,String filePath, AssetBundle bundle) async {
  String code;
  try {
    code = await bundle.loadString('lib/widgets/$filePath');
  } catch (err) {
    Navigator.of(context).pop();
    _launchURL(Application.github['widgetsURL'] + filePath);
  }
  _code = code;
}
