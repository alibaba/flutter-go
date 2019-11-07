/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: CupertinoPopupSurface 的示例

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// CupertinoPopupSurface 默认的实例
class CupertinoPopupSurfaceFullDefault extends StatefulWidget {
  const CupertinoPopupSurfaceFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoPopupSurfaceFullDefault();
}

// CupertinoPopupSurface 默认的实例,有状态
class _CupertinoPopupSurfaceFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: cupertinoPopupSurfaceBar(context));
  }

  Widget cupertinoPopupSurfaceBar(BuildContext context) {
    return CupertinoPopupSurface(
      isSurfacePainted: false,
      child: Container(
          color: CupertinoColors.inactiveGray,
          alignment: Alignment.center,
          child: Text('这里是内容',
              style: TextStyle(
                  color: Colors
                      .white))), // 应用程序默认路由,（Navigator.defaultRouteName，即/）
    );
  }
}
