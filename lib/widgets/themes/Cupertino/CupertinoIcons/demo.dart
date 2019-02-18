/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/20
 * Time: 上午11:34
 * email: zhu.yan@alibaba-inc.com
 * tartget: CupertinoIcons 的示例
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/resources/icon_names.dart' as icon_names;

/*
* CupertinoIcons 默认的实例
* */
class CupertinoIconsFullDefault extends StatefulWidget {
  const CupertinoIconsFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CupertinoIconsFullDefault();
}

/*
* CupertinoIcons 默认的实例,有状态
* */
class _CupertinoIconsFullDefault extends State {

  final colorsList = [];
  final List<Widget> widgetList = [];

  Widget rowView(IconData itA,IconData itB){
    //print('itA=====>${itA.fontPackage}');
    return Row(
      //mainAxisSize:MainAxisSize.max,
      //crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex:1,
          child: CupertinoButton(
            padding: EdgeInsets.only(left: 0),
            onPressed: () { },
            child:FlatButton.icon(
                label: Text('默认按钮', semanticsLabel: 'Add'),
                icon:Icon(itA,
                semanticLabel: 'Add',
            ),
            onPressed: () { },
        ))),
        Expanded(
            flex:1,
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () { },
                child:FlatButton.icon(
                  label: Text('默认按钮', semanticsLabel: 'Add'),
                  icon:Icon(itB,
                    semanticLabel: 'Add',
                  ),
                  onPressed: () { },
                ))),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    final names = icon_names.CupertinoIIconNames.names;
    for(var i=0;i<names.length-2;i++){
      if(i%2 == 0){
        widgetList.add(rowView(names[i],names[i+1]));
      }
    }
  }

  Widget build(BuildContext context) {
    return
      Align(
          //alignment: Alignment.center,
          //width: MediaQuery.of(context).size.width,
          child:Column(
          //verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgetList
      ));
  }
}