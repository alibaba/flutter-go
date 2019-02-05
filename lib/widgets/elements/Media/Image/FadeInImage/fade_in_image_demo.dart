/*
 * @Author: 一凨 
 * @Date: 2018-12-08 16:08:41 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-08 16:22:50
 */
import 'package:flutter/material.dart';

class FadeInImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         ClipOval(
          child:  FadeInImage.assetNetwork(
            placeholder: "assets/images/normal_user_icon.png", //预览图
            fit: BoxFit.fitWidth,
            image:
                "https://img.alicdn.com/tfs/TB148sWfMHqK1RjSZFgXXa7JXXa-536-482.png",
            width: 160.0,
            height: 160.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
         CircleAvatar(
          backgroundImage:  NetworkImage(
              "https://img.alicdn.com/tfs/TB148sWfMHqK1RjSZFgXXa7JXXa-536-482.png"),
          child:  Text("一凨"), //可以在图片上添加文字等等
        ),
      ],
    );
  }
}
