/// @Author: 一凨
/// @Date: 2018-12-08 17:49:19
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-08 20:46:37

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class MemoryImageDemo extends StatefulWidget {
  _MemoryImageDemoState createState() => _MemoryImageDemoState();
}

class _MemoryImageDemoState extends State<MemoryImageDemo> {
  Uint8List bytes;

  void initState() {
    super.initState();
    rootBundle.load('assets/images/food01.jpeg').then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      image: bytes == null
          ? null
          : DecorationImage(
              image: MemoryImage(bytes, scale: 1.0),
            ),
    );
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: decoration,
    );
  }
}
