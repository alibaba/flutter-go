/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 14/01/2019
 * Time: 23:00
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

abstract class OnSkipClickListener {
  void onSkipClick();
}



class _WelcomePageState extends State<WelcomePage> implements OnSkipClickListener {
  @override
  void onSkipClick() {

  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Container(
          color: Colors.white,
          child: new Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547488149046&di=d30f671ee92d67c1b93dce3eb4b11d5e&imgtype=0&src=http%3A%2F%2Fp0.ssl.qhimg.com%2Ft01c3f5bf72e7d1ac67.png',
            fit: BoxFit.contain,
          ),
          constraints: new BoxConstraints.expand(),
        ),
//        new Container(
//          child: Align(
//            alignment: Alignment.topRight,
//            child: new Container(
//              padding: const EdgeInsets.only(top: 30.0, right: 20.0),
//              child: new SkipDownTimeProgress(
//                Colors.red,
//                22.0,
//                new Duration(seconds: 5),
//                new Size(25.0, 25.0),
//                skipText: "跳过",
//                clickListener: this,
//              ),
//            ),
//          ),
//        ),
      ]
    );
  }
}







class _DrawProgress extends CustomPainter {
  final Color color;
  final double radius;
  double angle;
  AnimationController animation;

  Paint circleFillPaint;
  Paint progressPaint;
  Rect rect;

  _DrawProgress(this.color, this.radius,
      {double this.angle, AnimationController this.animation}) {
    circleFillPaint = new Paint();
    circleFillPaint.color = Colors.white;
    circleFillPaint.style = PaintingStyle.fill;

    progressPaint = new Paint();
    progressPaint.color = color;
    progressPaint.style = PaintingStyle.stroke;
    progressPaint.strokeCap = StrokeCap.round;
    progressPaint.strokeWidth = 4.0;

    if (animation != null && !animation.isAnimating) {
      animation.forward();
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width / 2;
    double y = size.height / 2;
    Offset center = new Offset(x, y);
    canvas.drawCircle(center, radius - 2, circleFillPaint);
    rect = Rect.fromCircle(center: center, radius: radius);
    angle = angle * (-1);
    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi * angle / 180;
    print("draw paint-------------------= $startAngle, $sweepAngle");
    //canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
    Path path = new Path();
    path.arcTo(rect, startAngle, sweepAngle, true);
    canvas.drawPath(path, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class SkipDownTimeProgress extends StatefulWidget {
  final Color color;
  final double radius;
  final Duration duration;
  final Size size;
  String skipText;
  OnSkipClickListener clickListener;

  SkipDownTimeProgress(
      this.color,
      this.radius,
      this.duration,
      this.size, {
        Key key,
        String this.skipText = "跳过",
        OnSkipClickListener this.clickListener,
      }) : super(key: key);

  @override
  _SkipDownTimeProgressState createState() {
    return new _SkipDownTimeProgressState();
  }
}

class _SkipDownTimeProgressState extends State<SkipDownTimeProgress>
    with TickerProviderStateMixin {
  AnimationController animationController;
  double curAngle = 360.0;

  @override
  void initState() {
    super.initState();
    print('initState----------------------');
    animationController =
    new AnimationController(vsync: this, duration: widget.duration);
    animationController.addListener(_change);
    _doAnimation();
  }

  @override
  void didUpdateWidget(SkipDownTimeProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget----------------------');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose----------------------');
    animationController.dispose();
  }

  void _onSkipClick() {
    if (widget.clickListener != null) {
      print('skip onclick ---------------');
      widget.clickListener.onSkipClick();
    }
  }

  void _doAnimation() async {
    Future.delayed(new Duration(milliseconds: 50), () {
      if(mounted) {
        animationController.forward().orCancel;
      }else {
        _doAnimation();
      }
    });
  }

  void _change() {
    print('ange == $animationController.value');
    double ange =
    double.parse(((animationController.value * 360) ~/ 1).toString());
    setState(() {
      curAngle = (360.0 - ange);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _onSkipClick,
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new CustomPaint(
            painter:
            new _DrawProgress(widget.color, widget.radius, angle: curAngle),
            size: widget.size,
          ),
          Text(
            widget.skipText,
            style: TextStyle(
                color: widget.color,
                fontSize: 13.5,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

