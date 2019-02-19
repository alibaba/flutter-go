/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/20
/// Time: 上午11:34
/// email: zhu.yan@alibaba-inc.com
/// target: Canvas 的示例

import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:math';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

CustomPaint graph;
var image;

class CustomViewPage extends StatefulWidget {
  
  final String type;
  CustomViewPage({this.type='drawLine'}) : super();

  @override
  State<StatefulWidget> createState() => CustomViewPageState();
}

class CustomViewPageState extends State<CustomViewPage>
    with SingleTickerProviderStateMixin {

  static Future<ui.Image> getImage(String asset) async {
    ByteData data = await rootBundle.load(asset);
    Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void initState() {
    super.initState();
    getImage("assets/images/painterImg.jpeg").then((data) {
      if (mounted) {
        setState(() {
          image = data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    graph = CustomPaint(
        painter: DrawPainter(type:widget.type)
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.all(10.0),
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
      ..filterQuality = FilterQuality.high
      ..style = PaintingStyle.stroke;
  }
  ///Flutter中负责View绘制的地方，使用传递来的canvas和size即可完成对目标View的绘制

  @override
  void paint(Canvas canvas, Size size) {
    switch(type) {
      case 'drawPoints':
        const List<Offset> points1 = [Offset(20.0, 0.0), Offset(100.0, 50.0), Offset(150.0, 0.0),Offset(300.0, 0.0)];
        const List<Offset> points2 = [Offset(20.0, 100.0), Offset(100.0, 100.0), Offset(150.0, 100.0), Offset(300.0, 100.0)];
        const List<Offset> points3 = [Offset(20.0, 150.0), Offset(100.0, 150.0), Offset(150.0, 180.0), Offset(300.0, 150.0)];
        //绘制点
        canvas.drawPoints(
            ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
            PointMode.points,
            points1,
            painter..color = Colors.redAccent // 这里可以追加修改 painter 属性
                   ..strokeWidth = 10.0
        );
        canvas.drawPoints(
          ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
            PointMode.lines,
            points2,
            painter..color = Colors.orange // 这里可以追加修改 painter 属性
              ..strokeWidth = 10.0
        );
        canvas.drawPoints(
          ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
            PointMode.polygon,
            points3,
            painter..color = Colors.blue // 这里可以追加修改 painter 属性
              ..strokeWidth = 10.0
        );
        break;
      case 'drawLine':
        //绘制直线
        canvas.drawLine(Offset(20.0, 0.0), Offset(size.width*0.8, 200), painter ..color = Colors.redAccent);
        break;
      case 'rawCircle':
        //绘制圆 参数(圆心，半径，画笔)
        canvas.drawCircle(
          Offset(size.width/2, 100.0),
          100.0,
          painter
          ..color = Colors.greenAccent
          ..style = PaintingStyle.stroke //绘画风格改为stroke
        );
        break;
      case 'drawOval':
        // 绘制椭圆
        // 使用左上和右下角坐标来确定矩形的大小和位置,椭圆是在这个矩形之中内切的形状
        Rect rect1 = Rect.fromPoints(Offset(0.0, 0.0), Offset(size.width, 200.0));
        canvas.drawOval(rect1, painter ..color = Colors.indigo);
        break;
      case 'drawArc':
        // 绘制圆弧
        // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
        const PI = 3.1415926;
        Rect rect1 = Rect.fromCircle(center: Offset(20, 50.0), radius: 100.0);
        canvas.drawArc(rect1, 0.0, PI / 2, false, painter ..color = Colors.pink);

        Rect rect2 = Rect.fromCircle(center: Offset(size.width*0.6, 50.0), radius: 100.0);
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
        Rect rect1 = Rect.fromCircle(center: Offset(80.0, 100.0), radius: 50.0);
        Rect rect2 = Rect.fromCircle(center: Offset(250.0, 100.0), radius: 50.0);
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
      case 'drawImage':
        // canvas.drawImage(image, Offset(0.0, 0.0), painter);
        final src = Rect.fromLTWH(0.0, 0.0, 684.0, 442.0);
        final dst = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
        canvas.drawImageRect(image, src, dst, painter);
        break;
      case 'drawStar':
        var rect = Offset.zero & size;
        /// 背景颜色
        canvas.drawRect(rect, Paint()..color = Color(0xFF000000));
        /// 绘制星形
        canvas.drawPath(MathTools().regularStarPath(5, 30, Offset(50.0, 50.0)), painter..color = Colors.red);
        /// 绘制多边形
        canvas.save();// save之后，可以调用Canvas的平移、放缩、旋转、错切、裁剪等操作
        canvas.translate(0, 100);
        canvas.scale(1.2,1.2);
        canvas.drawPath(MathTools().nStarPath(4, 30, 30, Offset(40.0, 50.0)), painter);
        canvas.restore();// 用来恢复Canvas之前保存的状态。防止save后对Canvas执行的操作对后续的绘制有影响
        /// 绘制旋转星形
        canvas.save();// save之后，可以调用Canvas的平移、放缩、旋转、错切、裁剪等操作
        canvas.translate(150, 50);
        canvas.rotate(50 * pi / 180);
        canvas.drawPath(MathTools().regularStarPath(5, 30, Offset(0,0)), painter..color = Colors.green);
        canvas.restore();// 用来恢复Canvas之前保存的状态。防止save后对Canvas执行的操作对后续的绘制有影响
        /// 绘制变形星形
        canvas.save();// save之后，可以调用Canvas的平移、放缩、旋转、错切、裁剪等操作
        canvas.translate(80, 100);
        canvas.skew(0.5,0.2);
        canvas.drawPath(MathTools().regularStarPath(6, 30,Offset(50,50)), painter..color = Colors.lime);
        canvas.restore();// 用来恢复Canvas之前保存的状态。防止save后对Canvas执行的操作对后续的绘制有影响

        /// 绘制matrix星形
        canvas.translate(250, 0);
        Float64List matrix = Float64List.fromList(const <double>[
          // careful, this is in _column_-major order
          0.7,  -0.7, 0.0, 0.0,
          0.7,   0.7,  0.0, 0.0,
          0.7,   0.0,     1.0, 0.0,
          -70.697, 98.057,  0.0, 1.0,
        ]);
        canvas.transform(matrix);
        canvas.drawPath(MathTools().regularStarPath(5, 30,Offset(50,50)), painter..color = Colors.blue);

        break;
    }
    //canvas.drawColor(Colors.red, BlendMode.colorDodge);
  }

  ///控制自定义View是否需要重绘的，返回false代表这个View在构建完成后不需要重绘。
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MathTools {
  static MathTools _mathTools;
  static bool _flag;

  factory MathTools(){
    if (_flag == null) {
      _flag = true;
    }
    if (_flag) {
      _mathTools = new MathTools._internal();
      _flag = false;
    }
    return _mathTools;
  }
  MathTools._internal();
  ///
  ///画正n角星的路径:
  ///
  ///@param num 角数
  ///@param R   外接圆半径
  ///@return 画正n角星的路径
  ///
  Path regularStarPath(int num, double R, Offset xy) {
    double degA, degB;
    if (num % 2 == 1) {
      //奇数和偶数角区别对待
      degA = 360 / num / 2 / 2;
      degB = 180 - degA - 360 / num / 2;
    } else {
      degA = 360 / num / 2;
      degB = 180 - degA - 360 / num / 2;
    }
    double r = R * sin(_rad(degA)) / sin(_rad(degB));
    return nStarPath(num, R, r, xy);
  }

  ///
  ///画正n边形的路径
  ///
  ///@param num 边数
  ///@param R   外接圆半径
  ///@return 画正n边形的路径
  ///
  Path regularPolygonPath(int num, double R, Offset xy) {
    double r = R * cos(_rad(360 / num / 2)); //!!一点解决
    return nStarPath(num, R, r, xy);
  }

  ///
  ///n角星路径
  ///
  ///@param num 几角星
  ///@param R   外接圆半径
  ///@param r   内接圆半径
  ///@return n角星路径
  ///
  Path nStarPath(int num, double R, double r, Offset xy) {
    Path path = new Path();
    double perDeg = 360 / num; //尖角的度数
    double degA = perDeg / 2 / 2;
    double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

    path.moveTo(cos(_rad(degA)) * R + xy.dx, (-sin(_rad(degA)) * R + xy.dy));
    for (int i = 0; i < num; i++) {
      path.lineTo(
          cos(_rad(degA + perDeg * i)) * R + xy.dx, -sin(_rad(degA + perDeg * i)) * R + xy.dy);
      path.lineTo(
          cos(_rad(degB + perDeg * i)) * r + xy.dx, -sin(_rad(degB + perDeg * i)) * r + xy.dy);
    }
    path.close();
    return path;
  }
  double _rad(double deg) {
    return deg * pi / 180;
  }
}
