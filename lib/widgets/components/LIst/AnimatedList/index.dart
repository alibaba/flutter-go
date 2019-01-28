/**
 * Created with Android Studio.
 * User: ryan
 * Date: 2018/12/31
 * Time: 下午9:48
 * email: zhu.yan@alibaba-inc.com
 * tartget: AnimatedList 的示例
 */
import 'package:flutter_go/components/widget_demo.dart';
import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import './demo.dart';


//var _AnimatedListFullDefault = AnimatedListDemo.AnimatedListFullDefault;
GlobalKey globalKey = GlobalKey();

const String _Text0 =
"""### **简介**
> AnimatedList “动画滚动容器”
- 一个滚动容器，可在插入或移除项目时为其设置动画
""";


const String _Text1 =
"""### **基本用法**
> AnimatedList
- AnimatedListState 可用于动态插入或删除项目。
- 下面示例展示效果:点击+号增加 card, 点击 card 保持激活状态，再点击-号，减少 card。
""";


class Demo extends StatefulWidget {
  static const String routeName = '/components//List/AnimatedList';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  State animatedList;
  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'AnimatedList',
      codeUrl: 'components/List/AnimatedList/demo.dart',
      contentList: [allDemoBoxs(context, this)],
      docUrl: 'https://docs.flutter.io/flutter/widgets/AnimatedList-class.html',
    );
  }
}

/*
 * 所有的 AnimatedList widget
 * context: 运行上下文
 * that: 指向有状态的 StatefulWidget
 */
Widget allDemoBoxs(BuildContext context, _DemoState that) {
  return Container(
    //padding: new EdgeInsets.only(bottom: 20.0, top: 20.0, left: 0, right: 0),
      child: Column(
        //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MarkdownBody(data: _Text0),
            SizedBox(height: 20.0), // 间距
            MarkdownBody(data: _Text1),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                assistButtonLeft(that),
                SizedBox(width: 20.0), // 间距
                assistButtonRight(that),
              ],
            ),
            //AnimatedListDemo.AnimatedListFullDefault(key:globalKey,parent:context),
            AnimatedListFullDefault(key:globalKey,parent:that),
            SizedBox(height: 20.0), // 间距
          ])
  );
}

/*
* 演示辅助按钮
* */
Widget assistButtonLeft(that) {
  return FloatingActionButton(
    // 文本内容
      backgroundColor:Colors.red,
      child: const Icon(Icons.add_circle_outline),
      heroTag: null, // 不加这个参数会黑屏...
      onPressed: () {
        //demo.insert();
        //print('${globalKey.currentState}');
        that.animatedList.insert();
      }
  );
}

/*
* 演示辅助按钮
* */
Widget assistButtonRight(that) {
  return FloatingActionButton(
    // 文本内容
      backgroundColor:Colors.green,
      child: const Icon(Icons.remove_circle_outline),
      heroTag: null, // 不加这个参数会黑屏...
      onPressed: () {
        that.animatedList.remove();
      }
  );
}

