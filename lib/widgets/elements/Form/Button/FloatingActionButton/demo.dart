/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/11/22
 * Time: 上午12:03
 * email: zhu.yan@alibaba-inc.com
 * tartget: OutlineButton 的示例
 */
import 'package:flutter/material.dart';

/*
* OutlineButton 默认按钮的实例
* isDisabled:是否是禁用，isDisabled 默认为true
* */
class FloatingActionButtonDefault extends StatelessWidget {
  final bool isDisabled;

  const FloatingActionButtonDefault([ this.isDisabled = true])
      : assert(isDisabled != null),
        super();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        // 文本内容
        backgroundColor:Colors.red,
        child: const Icon(Icons.add),
        heroTag: null, // 不加这个参数会黑屏...
        onPressed: isDisabled ? () {} : null);
  }
}

/*
* OutlineButton 自定义的实例
* */
class FloatingActionButtonCustom extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const FloatingActionButtonCustom(
      [ this.txt = '自定义按钮',
       this.color = Colors.orange,
       this.shape,
       this.onPressed])
      : super();

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return  FloatingActionButton(
      // 子视图，一般为Icon，不推荐使用文字
      child: const Icon(Icons.refresh),
      // FAB的文字解释，FAB被长按时显示，也是无障碍功能
      tooltip: txt,
      // 前景色
      foregroundColor: Colors.white,
      // 背景色
      backgroundColor: color,
     // hero效果使用的tag,系统默认会给所有FAB使用同一个tag,方便做动画效果,简单理解为两个界面内拥有同样tag的元素在界面切换过程中，会有动画效果，是界面切换不再那么生硬。
      heroTag: null,
      // 未点击时阴影值，默认6.0
      elevation: 7.0,
      // 点击时阴影值，默认12.0
      highlightElevation: 14.0,
      // 点击事件回调
      onPressed: () {
        Scaffold.of(context).showSnackBar( SnackBar(
          content: Text("FAB is Clicked"),
        ));
        _onPressed();
      },
      // 是否为“mini”类型，默认为false,FAB 分为三种类型：regular, mini, and extended
      mini: false,
      // 定义FAB的shape，设置shape时，默认的elevation将会失效,默认为CircleBorder
      //shape: CircleBorder(),
      shape: shape,
      // 是否为”extended”类型
      isExtended: true
    );
  }
}

/*
* OutlineButton 自定义的实例2
* */
class FloatingActionButtonCustom2 extends StatelessWidget {
  final String txt;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  const FloatingActionButtonCustom2(
      [ this.txt = '自定义按钮',
         this.color = Colors.orange,
         this.shape,
         this.onPressed])
      : super();

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return FloatingActionButton.extended(
      onPressed: () {
        print('button click');
        _onPressed();
      },
      foregroundColor: Colors.white,
      backgroundColor: Colors.amber,
      //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
      icon:  Icon(Icons.flag,color: Colors.red),
      label:  Text('FloatingActionButton.extended', maxLines: 1),
    );
  }
}
