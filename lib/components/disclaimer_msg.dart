/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/1/12
/// Time: 下午9:19
/// email: zhu.yan@alibaba-inc.com

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const disclaimerText1 =
    '\r\r\r\r\r\r本APP属于个人的非赢利性开源项目，以供开源社区使用，凡本APP转载的所有的文章 、图片、音频、视频文件等资料的版权归版权所有人所有，本APP采用的非本站原创文章及图片等内容无法一一和版权者联系，如果本网所选内容的文章作者及编辑认为其作品不宜上网供大家浏览，或不应无偿使用请及时用电子邮件或电话通知我们，以迅速采取适当措施，避免给双方造成不必要的经济损失。';
const disclaimerText2 =
    '\n\r\r\r\r\r\r对于已经授权本APP独家使用并提供给本站资料的版权所有人的文章、图片等资料，如需转载使用，需取得本站和版权所有人的同意。本APP所刊发、转载的文章，其版权均归原作者所有，如其他媒体、网站或个人从本网下载使用，请在转载有关文章时务必尊重该文章的著作权，保留本网注明的“稿件来源”，并自负版权等法律责任。';

class DisclaimerMsg extends StatefulWidget {
  final State pWidget;

  DisclaimerMsg({Key key, this.pWidget}) : super(key: key);

  DisclaimerMsgState createState() => DisclaimerMsgState();
}


class DisclaimerMsgState extends State<DisclaimerMsg> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<bool> _unKnow;
  bool _getReaded = false;

  //SharedPreferences 存储结果
  void refs(bool value) async {
    final SharedPreferences prefs = await _prefs;
    final bool unKnow = value;
    _valBool = value;
    _readed = value;
    if (mounted) {
      setState(() {
        _unKnow =
            prefs.setBool("disclaimer::Boolean", unKnow).then((bool success) {
              return unKnow;
            });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //获取SharedPreferences 存储结果
    _unKnow = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('disclaimer::Boolean') ?? false);
    });
    _unKnow.then((bool value) {
      // 第一次需要自动弹出免费声明
      if(!value) {
        showAlertDialog(context, 
          readedFn: (val) {
            setState(() {
              _getReaded = val;
            });
            refs(val);
          }
        );
      } else {
        setState(() {
          _getReaded = value;
        });
      }
      
    });
  }

  /// @param readedFn 获取是否已读的回到函数
  /// showDialog中的context和外面的context不一致，不能使用setState
  /// showDialog中只控制checkBox的值
  showAlertDialog(BuildContext context, {
    @required Function readedFn,
  }) {
    bool _valBool = false;
    bool _readed = _getReaded;
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              //title: Text('免责声明'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                        //width: 100,
                        height: 35,
                        child: Text('免责声明',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        decoration: BoxDecoration(
                          //color: Colors.blue,
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/images/paimaiLogo.png')),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          //alignment: Alignment.bottomRight,
                        )),
                    SizedBox(height: 20),
                    Text(disclaimerText1),
                    Text(disclaimerText2),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)), // 圆角

              actions: <Widget>[
                new Container(
                  width: 250,
                  child: _readed ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('已阅读知晓',
                            style: TextStyle(fontSize: 16, color: Colors.white)),
                        //可点击
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 10.0,
                      )
                    ],
                  ) : Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          activeColor: Theme.of(context).primaryColor,
                          tristate: false,
                          value: _valBool,
                          onChanged: (bool bol) {
                            state(() {
                              _valBool = bol;
                            });
                          }
                        ),
                        Text('不再自动提示', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    FlatButton(
                      child: Text('知道了',
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                      //可点击
                      color: _valBool
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withAlpha(800),
                      onPressed: () {
                        if (_valBool) {
                          // _valBool 在此处为true 不可能为false，
                          // 所以readedFn返回的参数是true，代表已经阅读
                          readedFn(_valBool);
                          Navigator.of(context).pop(() {                            
                            state(() {
                              _readed = _valBool;
                            });
                          });
                        }
                      },
                    ),
                  ])
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showAlertDialog(context, readedFn: (){});
        },
        child: Stack(
          //alignment: const Alignment(1.6, 1.6),
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                //width: 100,
                height: 35,
                child: Text('免责声明',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                decoration: BoxDecoration(
                  //color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/paimaiLogo.png')),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  //alignment: Alignment.bottomRight,
                )),
            SizedBox(height: 20),
            Text(disclaimerText1),
            Text(disclaimerText2),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)), // 圆角

      actions: <Widget>[
        new Container(
          width: 250,
          child: _create(),
        )
      ],
    );
  }}
