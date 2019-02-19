/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: PainterPath 的示例

import 'dart:ui';

import 'package:flutter/material.dart';

CustomPaint graph;

class CustomViewPage extends StatefulWidget {
  
  final String type;
  CustomViewPage({this.type='simpleline'}) : super();

  @override
  State<StatefulWidget> createState() => CustomViewPageState();
}

class CustomViewPageState extends State<CustomViewPage>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    graph = CustomPaint(
        painter: DrawPainter(type:widget.type)
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.all(50.0),
        //padding: EdgeInsets.all(10.0),
        child: graph
        //child:Center(child: graph)
    );
  }


  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

///新建类继承于CustomPainter并且实现CustomPainter里面的paint（）和shouldRepaint方法
class DrawPainter extends CustomPainter {
  Paint painter;
  final type;

  DrawPainter ({this.type}){
    //    Paint painter = Paint()
    //    ..color = Colors.blueAccent //画笔颜色
    //    ..strokeCap = StrokeCap.round //画笔笔触类型
    //    ..isAntiAlias = true //是否启动抗锯齿
    //    ..blendMode = BlendMode.exclusion //颜色混合模式
    //    ..style = PaintingStyle.fill //绘画风格，默认为填充
    //    ..colorFilter = ColorFilter.mode(Colors.blueAccent,BlendMode.exclusion) //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    //    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果，flutter中只有这个
    //    ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    //    ..strokeWidth = 15.0 ;//画笔的宽度

    painter = new Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
  }
  ///Flutter中负责View绘制的地方，使用传递来的canvas和size即可完成对目标View的绘制

  @override
  void paint(Canvas canvas, Size size) {
    //canvas.drawColor(Colors.red, BlendMode.colorDodge);
    Path path = new Path();
    drawThisPath(canvas, size, path);
    path.close();
    canvas.drawPath(path, painter);
  }

  void drawThisPath(Canvas canvas, Size size, Path path,) {
    switch(type) {
      case 'simpleline':
      //新建了一个path,然后将路径起始点移动到坐标(100,100)的位置
        Path path = new Path()..moveTo(0.0, 0.0);
        path.lineTo(200.0, 200.0);
        canvas.drawPath(path, painter);
        break;
      case 'polyline':
        Path path = new Path()..moveTo(100.0, 10.0);

        path.lineTo(200.0, 150.0);
        path.lineTo(100.0, 200.0);

        canvas.drawPath(path, painter);
        break;
      case 'Besizerline2':
        Path path = new Path()..moveTo(0.0, 0.0);
        Rect rect1 = Rect.fromCircle(center: Offset(50.0, 100.0), radius: 60.0);
        path.arcTo(rect1, 0.0, 3.14, false);
        canvas.drawPath(path, painter);

        Rect rect2 = Rect.fromCircle(center: Offset(200.0, 100.0), radius: 60.0);
        path.arcTo(rect2, 0.0, 3.14*2, true);
        canvas.drawPath(path, painter);
        break;
      case 'Besizerline3':
        var width = size.width;
        var height = 300;
        Path path = new Path()..moveTo(width / 2, height / 4);
        path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
            (height * 2) / 5, width / 2, (height * 7) / 12);
        canvas.drawPath(path, painter
          // ..style = PaintingStyle.fill
          // ..color = Colors.red
        );

        Path path2 = new Path();
        path2.moveTo(width / 2, height / 4);
        path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
            width / 2, (height * 7) / 12);
        canvas.drawPath(path2, painter);
        break;
      case 'drawArc':
      // 绘制圆弧
      // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
        const PI = 3.1415926;
        Rect rect1 = Rect.fromCircle(center: Offset(size.width/2, 0.0), radius: 100.0);
        canvas.drawArc(rect1, 0.0, PI / 2, false, painter ..color = Colors.pink);

        Rect rect2 = Rect.fromCircle(center: Offset(size.width/2, 150.0), radius: 100.0);
        canvas.drawArc(rect2, 0.0, PI / 2, true, painter ..color = Colors.deepPurple);
        break;
      case 'drawRRect':
      /// fromPoints(Offset a, Offset b)
      /// 使用左上和右下角坐标来确定矩形的大小和位置
      /// fromCircle({ Offset center, double radius })
      /// 使用圆的圆心点坐标和半径和确定外切矩形的大小和位置
      /// fromLTRB(double left, double top, double right, double bottom)
      /// 使用矩形左边的X坐标、矩形顶部的Y坐标、矩形右边的X坐标、矩形底部的Y坐标来确定矩形的大小和位置
      /// fromLTWH(double left, double top, double width, double height)
      /// 使用矩形左边的X坐标、矩形顶部的Y坐标矩形的宽高来确定矩形的大小和位置
      // 用Rect构建一个边长50,中心点坐标为50,100的矩形
        Rect rect1 = Rect.fromCircle(center: Offset(50.0, 50.0), radius: 50.0);
        Rect rect2 = Rect.fromCircle(center: Offset(200.0, 50.0), radius: 50.0);
        // 根据上面的矩形,构建一个圆角矩形
        RRect rrect1 = RRect.fromRectAndRadius(rect1, Radius.circular(0.0));
        canvas.drawRRect(rrect1, painter);
        RRect rrect2 = RRect.fromRectAndRadius(rect2, Radius.circular(20.0));
        canvas.drawRRect(rrect2, painter);
        break;
      case 'drawDRRect':
      //绘制两个矩形
        Rect rect1 = Rect.fromCircle(center: Offset(size.width/2, 100.0), radius: 60.0);
        Rect rect2 = Rect.fromCircle(center: Offset(size.width/2, 100.0), radius: 40.0);
        //分别绘制外部圆角矩形和内部的圆角矩形
        RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(30.0));
        RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(5.0));
        canvas.drawDRRect(outer, inner, painter ..color = Colors.lime);
        break;
    }
  }

  ///控制自定义View是否需要重绘的，返回false代表这个View在构建完成后不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
