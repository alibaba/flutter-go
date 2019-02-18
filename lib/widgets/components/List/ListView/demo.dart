/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2018/12/31
 * Time: 下午2:27
 * email: zhu.yan@alibaba-inc.com
 * tartget: ListView 的示例
 */

import 'package:flutter/material.dart';

/*
* ListView 默认ListView的实例
* */
class ListViewFullDefault extends StatefulWidget {
  const ListViewFullDefault() : super();

  @override
  State<StatefulWidget> createState() => _ListViewFullDefault();
}

/*
* ListView 默认的实例,有状态
* */
class _ListViewFullDefault extends State {
  @override
  Widget build(BuildContext context) {
    return ListView(
    );
  }
}

/*
* ListView 默认的实例,无状态
* */
class ListViewLessDefault extends StatelessWidget {
  final widget;
  final parent;
  final index;

  const ListViewLessDefault([this.index, this.widget, this.parent,])
      : super();

  @override
  Widget build(BuildContext context) {
    switch(index){
      case 0:
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Text('I\'m dedicating every day to you'),
            ListTile(
              leading:  Icon(Icons.map),
              title:  Text('Maps'),
            ),
            Text('Domestic life was never quite my style'),
            ListTile(
              leading:  Icon(Icons.photo_album),
              title:  Text('Album'),
            ),
            Text('When you smile, you knock me out, I fall apart'),
            ListTile(
              leading:  Icon(Icons.phone),
              title:  Text('Phone'),
            ),
            Text('And I thought I was so smart'),
          ],
        );
        break;
      case 1:
        return SizedBox(
          height: 300.0,
          child:  ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10, // item 的个数
            itemExtent: 50.0, // 如果为非null，则强制子项在滚动方向上具有给定范围
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title:  Text("title $index"), // item 标题
                  leading: Icon(Icons.keyboard), // item 前置图标
                  subtitle: Text("subtitle $index"), // item 副标题
                  trailing: Icon(Icons.keyboard_arrow_right),// item 后置图标
                  isThreeLine:false,  // item 是否三行显示
                  dense:true,                // item 直观感受是整体大小
                  contentPadding: EdgeInsets.all(10.0),// item 内容内边距
                  enabled:true,
                  onTap:(){print('点击:$index');},// item onTap 点击事件
                  onLongPress:(){print('长按:$index');},// item onLongPress 长按事件
                  selected:false,     // item 是否选中状态
              );
            },
          ),
        );
        break;
      case 2:
        return SizedBox(
          height: 300.0,
          child:  ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: 100, // item 的个数
            separatorBuilder: (BuildContext context, int index) => Divider(height:1.0,color: Colors.blue),  // 添加分割线
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title:  Text("title $index"), // item 标题
                leading: Icon(Icons.keyboard), // item 前置图标
                subtitle: Text("subtitle $index"), // item 副标题
                trailing: Icon(Icons.keyboard_arrow_right),// item 后置图标
                isThreeLine:false,  // item 是否三行显示
                dense:true,                // item 直观感受是整体大小
                contentPadding: EdgeInsets.all(10.0),// item 内容内边距
                enabled:true,
                onTap:(){print('点击:$index');},// item onTap 点击事件
                onLongPress:(){print('长按:$index');},// item onLongPress 长按事件
                selected:false,     // item 是否选中状态
              );
            },
          ),
        );
      break;
      case 3:
        return SizedBox(
          height: 300.0,
          child:  ListView.custom(
            scrollDirection: Axis.vertical,
            childrenDelegate:SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                height: 50.0,
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            }, childCount: 10),
          ),
        );
        break;
      default:
        return null;
        break;
    }
  }
}