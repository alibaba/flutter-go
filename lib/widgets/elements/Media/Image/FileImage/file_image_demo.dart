 /// @Author: 一凨 
 /// @Date: 2018-12-08 16:20:17 
 /// @Last Modified by: 一凨
 /// @Last Modified time: 2018-12-08 17:18:39

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileImageDemo extends StatefulWidget {
  @override
  _FileImageDemoState createState() =>  _FileImageDemoState();
}

class _FileImageDemoState extends State<FileImageDemo> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Center(
          child: _image == null
              ?  Text('您还未选择任何图片.')
              :  Image.file(_image,scale: 0.5,fit: BoxFit.cover,),
        ),
        FlatButton(
          onPressed: getImage,
          child: Text('点击选择图片',style: TextStyle(color: Colors.white),),
          color: Colors.lightBlue
        )
      ],
    );
  }
}
