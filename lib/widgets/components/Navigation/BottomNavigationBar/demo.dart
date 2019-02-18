/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/12/27
/// Time: 下午6:27
/// email: zhu.yan@alibaba-inc.com
/// target: BottomNavigationBar 的示例

import 'package:flutter/material.dart';


/// BottomNavigationBar 默认的实例
class BottomNavigationBarFullDefault extends StatefulWidget {
  const BottomNavigationBarFullDefault() : super();
  @override
  State<StatefulWidget> createState() => _BottomNavigationBarFullDefault();
}


/// BottomNavigationBar 默认的实例,有状态
class _BottomNavigationBarFullDefault extends State {
   int _currentIndex = 1;

  void _onItemTapped(int index) {
    if(mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // BottomNavigationBarType 中定义的类型，有 fixed 和 shifting 两种类型
      iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
      currentIndex: _currentIndex, // 当前所高亮的按钮index
      onTap: _onItemTapped, // 点击里面的按钮的回调函数，参数为当前点击的按钮 index
      fixedColor: Colors.deepPurple, // 如果 type 类型为 fixed，则通过 fixedColor 设置选中 item 的颜色
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(
            title:  Text("Home"), icon:  Icon(Icons.home)),
        BottomNavigationBarItem(
            title:  Text("List"), icon:  Icon(Icons.list)),
        BottomNavigationBarItem(
            title:  Text("Message"), icon:  Icon(Icons.message)),
        BottomNavigationBarItem(
            title:  Text("add"), icon:  Icon(Icons.add)),
        BottomNavigationBarItem(
            title:  Text("menu"), icon:  Icon(Icons.menu)),
        BottomNavigationBarItem(
            title:  Text("other"), icon:  Icon(Icons.devices_other)),

      ],
    );
  }
}

