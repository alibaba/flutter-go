import 'package:flutter/material.dart';

//颜色配置
class AppColor {
  static const int white = 0xFFFFFFFF;
  static const int mainTextColor = 0xFF121917;
  static const int subTextColor = 0xff959595;
}

//文本设置
class AppText {
  static const middleSize = 16.0;

  static const middleText = TextStyle(
    color: Color(AppColor.mainTextColor),
    fontSize: middleSize,
  );

  static const middleSubText = TextStyle(
    color: Color(AppColor.subTextColor),
    fontSize: middleSize,
  );
}

class WidgetDemoColor {
  static const int fontColor = 0xFF607173;
  static const int iconColor = 0xFF607173;
  static const int borderColor = 0xFFEFEFEF;
}
