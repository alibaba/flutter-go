/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2019/1/1
 * Time: 下午2:57
 * email: zhu.yan@alibaba-inc.com
 * tartget: Card 的示例
 */

import 'package:flutter/material.dart';

/*
* Checkbox 默认按钮的实例
* index 当前checkbox 的索引值
* */
class CardFullDefault extends StatefulWidget {
  const CardFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _CardFullDefault();
}

/*
* Card 默认的实例,有状态
* */
class _CardFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return Card(
      // ...  // 如果没有,就是不需要有状态的 StatefulWidget
    );
  }
}

/*
* Card 默认的实例,无状态
* */
class CardLessDefault extends StatelessWidget {
  final widget;
  final parent;

  const CardLessDefault([this.widget, this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior:Clip.antiAlias,// 根据设置裁剪内容
      color:Colors.green, //  卡片背景颜色
      elevation:20.0, // 卡片的z坐标,控制卡片下面的阴影大小
      margin:EdgeInsets.all(20.0),
      //  margin: EdgeInsetsDirectional.only(bottom: 30.0, top: 30.0, start: 30.0),// 边距
      semanticContainer:true, // 表示单个语义容器，还是false表示单个语义节点的集合，接受单个child，但该child可以是Row，Column或其他包含子级列表的widget
//      shape:new Border.all(
//          color: Colors.indigo, width: 1.0, style: BorderStyle.solid), // 卡片材质的形状，以及边框
      shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), // 圆角
      //borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Column( //card里面的子控件
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.access_time),
            title: Text('The Enchanted Nightingale',style: TextStyle(color: Colors.white, fontSize: 40.0)),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.',style: TextStyle(color: Colors.yellow, fontSize: 16.0)),
            contentPadding: EdgeInsets.all(20.0),// item 内容内边距
          ),
          ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS',style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  onPressed: () { /* ... */ },
                ),
                FlatButton(
                  child: const Text('LISTEN',style: TextStyle(color: Colors.black, fontSize: 14.0)),
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}