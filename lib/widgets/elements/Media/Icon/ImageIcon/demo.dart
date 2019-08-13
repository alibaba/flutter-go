 /// Author: xiaojia.dxj
 /// Date: 2018-12-15 15:19:41 
 /// Email: xiaojia.dxj@alibaba-inc.com
 /// Last Modified by: xiaojia.dxj
 /// Last Modified time: 2018-12-17 10:07:19
 

import 'package:flutter_web/material.dart';

class ImageIconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //注意：当你用一个图片的时候，这个图片会被整个覆盖，只保留图片的形状，填充你设置的颜色
    return  ImageIcon(
      AssetImage('images/btn_icon_dingyuehao_normal.png'),
      color: Colors.red,
      size: 50.0,
    );
  }
}
