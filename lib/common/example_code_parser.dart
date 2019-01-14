/*
 * @Author: 一凨 
 * @Date: 2019-01-14 11:42:36 
 * @Last Modified by: 一凨
 * @Last Modified time: 2019-01-14 15:53:20
 */
// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/services.dart';

const String _kStartTag = '// START ';
const String _kEndTag = '// END';

Map<String, String> _exampleCode;
String _code;

Future<String> getExampleCode(String filePath, AssetBundle bundle) async {
  if (_exampleCode == null)
    await _parseExampleCode(filePath,bundle);
  // return _exampleCode[filePath];
  return _code;
}

Future<void> _parseExampleCode(String filePath,AssetBundle bundle) async {
  
  final String code = await bundle.loadString('$filePath') ??
    '// $filePath not found\n';
    print('$filePath 1234567Nealyang');
    _code = code;
  // _exampleCode = <String, String>{};
  // final List<String> lines = code.split('\n');
  // List<String> codeBlock;
  // String codeTag;

  // for (String line in lines) {
  //   if (codeBlock == null) {
  //     // Outside a block.
  //     if (line.startsWith(_kStartTag)) {
  //       // Starting a new code block.
  //       codeBlock = <String>[];
  //       codeTag = line.substring(_kStartTag.length).trim();
  //     } else {
  //       // Just skipping the line.
  //     }
  //   } else {
  //     // Inside a block.
  //     if (line.startsWith(_kEndTag)) {
  //       // Add the block.
  //       _exampleCode[codeTag] = codeBlock.join('\n');
  //       codeBlock = null;
  //       codeTag = null;
  //     } else {
  //       // Add to the current block
  //       // trimRight() to remove any \r on Windows
  //       // without removing any useful indentation
  //       codeBlock.add(line.trimRight());
  //     }
  //   }
  // }
}
