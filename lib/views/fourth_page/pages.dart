import 'package:flutter/material.dart';
import '../../routers/application.dart';
import '../../routers/routers.dart';
import '../../utils/shared_preferences.dart';

final pages = [
  new PageViewModel(
      const Color(0xFFcd344f),
      //'assets/mountain.png',
      'assets/images/p2.png',
      'FlutterGo是什么？',
      '【FlutterGo】 是由"阿里拍卖"前端团队几位 Flutter 粉丝，用业余时间开发的一款，用于 Flutter 教学帮助的App，这里没有高大尚的概念，只有一个一个亲历的尝试，用最直观的方式展示的 Flutter 官方demo',
      'assets/images/plane.png'),
  new PageViewModel(
      const Color(0xFF638de3),
      //'assets/world.png',
      'assets/images/p1.png',
      'FLutterGo的背景',
      '🐢 官网文档示例较不够健全，不够直观\n🐞 运行widget demo要到处翻阅资料\n🐌 英文文档翻译生涩难懂，学习资料太少\n🚀 需要的效果不知道用哪个widget\n',
      'assets/images/calendar.png'),
  new PageViewModel(
    const Color(0xFFFF682D),
    //'assets/home.png',
    'assets/images/p3.png',
    'FlutterGo的特点',
    '🐡 详解常用widget多达 140+ 个\n🦋 持续迭代追新官方版本\n🐙 配套Demo详解widget用法\n🚀 一站式搞定所有常用widget,开箱即查\n',
    'assets/images/house.png',
  ),
];
SpUtil sp;

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;
  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });
  _goHomePage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  Widget creatButton(
      BuildContext context, String txt, IconData iconName, String type) {
    return RaisedButton.icon(
        onPressed: () async {
          if (type == 'start') {
            await SpUtil.getInstance()
              ..putBool(sharedPreferencesKeys.showWelcome, false);
            _goHomePage(context);
          } else if (type == 'goGithub') {
            Application.router.navigateTo(context,
                '${Routes.webViewPage}?title=${Uri.encodeComponent(txt)} Doc&&url=${Uri.encodeComponent("https://github.com/alibaba/flutter-go")}');
          }
        },
        elevation: 10.0,
        color: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
        icon: new Icon(iconName, color: Colors.white, size: 20.0),
        label: new Text(
          txt,
          maxLines: 1,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.infinity,
        /// height:MediaQuery.of(context).size.height-200.0,
        color: viewModel.color,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Opacity(
          opacity: percentVisible,
          child:ListView(
            children: <Widget>[
              layout(context)
            ],
          ),
        ));
  }

  Column layout(BuildContext context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Transform(
            transform: new Matrix4.translationValues(
                0.0, 50.0 * (1.0 - percentVisible), 0.0),
            child: new Padding(
              padding: new EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: new Image.asset(viewModel.heroAssetPath,
                  width: 160.0, height: 160.0),
            ),
          ),
          new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30.0 * (1.0 - percentVisible), 0.0),
            child: new Padding(
              padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text(
                viewModel.title,
                style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'FlamanteRoma',
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
          new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30.0 * (1.0 - percentVisible), 0.0),
            child: new Padding(
              padding: new EdgeInsets.only(bottom: 10.0),
              child: new Text(
                viewModel.body,
                textAlign: TextAlign.center,
                style: new TextStyle(
                  height: 1.2,
                  color: Colors.white,
                  fontFamily: 'FlamanteRomaItalic',
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              creatButton(context, '开始使用', Icons.add_circle_outline, 'start'),
              creatButton(context, 'GitHub', Icons.arrow_forward, 'goGithub'),
            ],
          )
        ]);
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}
