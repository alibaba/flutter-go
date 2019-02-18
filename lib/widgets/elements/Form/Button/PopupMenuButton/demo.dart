/// Created with Android Studio.
/// User: 一晟
/// Date: 2018/11/22
/// Time: 上午12:03
/// email: zhu.yan@alibaba-inc.com
/// target: PopupMenuButton 的示例

import 'package:flutter/material.dart';

/*
* RaisedButton 默认按钮的实例
* isDisabled:是否是禁用，isDisabled 默认为true
* */
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class PopupMenuButtonDefault extends StatelessWidget {
  final bool isDisabled;
  final String type;

  const PopupMenuButtonDefault(
      [ this.type = 'default1',  this.isDisabled = true])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'default1':
        return default1(context);
        break;
      case 'default2':
        return default2(context);
        break;
      case 'default3':
        return default3(context);
        break;
      default:
        return default1(context);
    }
  }

  Widget default1(BuildContext context) {
    return PopupMenuButton<WhyFarther>(
      onSelected: (WhyFarther result) {
        // setState(() { _selection = result; });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.harder,
              child: Text('Working a lot harder'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.smarter,
              child: Text('Being a lot smarter'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.selfStarter,
              child: Text('Being a self-starter'),
            ),
            const PopupMenuItem<WhyFarther>(
              value: WhyFarther.tradingCharter,
              child: Text('Placed in charge of trading charter'),
            ),
          ],
    );
  }

  Widget default2(BuildContext context) {
    return PopupMenuButton(
        child: Text('点我试试'),
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
               PopupMenuItem(value: "选项一的内容", child:  Text("选项一")),
               PopupMenuItem(value: "选项二的内容", child:  Text("选项二"))
            ]);
  }

  Widget default3(BuildContext context) {
    return PopupMenuButton(
        //child: Text('点我试试'),// child 和 icon 不能同时用
        icon: Icon(Icons.menu),
        onSelected: (String value) {},
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
               PopupMenuItem(value: "选项一的内容", child:  Text("选项一")),
               PopupMenuItem(value: "选项二的内容", child:  Text("选项二"))
            ]);
  }
}


class PopupMenuButtonCustom extends StatelessWidget {
  final widget;
  final parent;
  const PopupMenuButtonCustom([this.widget,this.parent])
      : super();
  @override
  Widget build(BuildContext context) {
    final String selectStr = widget.options['defaultSelect'];
    return PopupMenuButton(
        //如果提供，则用于此按钮的widget。
        child: RaisedButton.icon(
          disabledColor:Colors.red,
          icon: Icon(Icons.message, size: 25.0,color:Colors.yellow),
          label: Text(
                '自定义按钮', style: TextStyle(color: Colors.white),
                semanticsLabel: 'FLAT BUTTON'),
          onPressed:(){} // 激活状态按钮
        ),
        // 打开时放置菜单的z坐标。这可以控制菜单下方阴影的大小。
        elevation:10.0,
        // 如果提供，则用于此按钮的图标。
        //icon
        // 菜单项的值（如果有），在菜单打开时应突出显示。
        //initialValue:options['defaultSelect'],
        initialValue:selectStr,
        // 按下按钮时调用以创建要在菜单中显示的项目。
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
           PopupMenuItem(value: "选项一的内容", child:  Text("选项一")),
           PopupMenuItem(value: "选项二的内容", child:  Text("选项二")),
           PopupMenuItem(value: "选项三的内容", child:  Text("选项三")),
           PopupMenuItem(value: "选项四的内容", child:  Text("选项四"))
        ],
        // 应用于弹出菜单按钮的偏移量(x,y)。
        offset:Offset(0.0,50.0),
        // 当用户在不选择项目的情况下关闭弹出菜单时调用。
        onCanceled:()=>
          print('onCanceled'),
        // 当用户从此按钮创建的弹出菜单中选择一个值时调用。
        onSelected:(String value){
          print('onSelected:${parent.setState}');
          parent.setState((){
            widget.options['defaultSelect']= value;
          });
        },
        // 默认情况下匹配IconButton的8 dps填充。在某些情况下，特别是在此按钮作为列表项的尾随元素出现的情况下，能够将填充设置为零是有用的。
        padding: EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0.0, right: 0.0),
        //描述按下按钮时将发生的操作的文本。
        tooltip:'这是信息'
    );
  }
}