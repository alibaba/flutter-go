/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/1/12
 * Time: 下午9:19
 * email: zhu.yan@alibaba-inc.com
 */
import 'package:flutter/material.dart';
//import 'package:flutter_rookie_book/model/collection_general.dart';
//import 'package:flutter_rookie_book/model/collection_general.dart';


const disclaimerText1 = '\r\r\r\r\r\r本APP属于个人的非赢利性开源项目，以供开源社区使用，凡本APP转载的所有的文章 、图片、音频、视频文件等资料的版权归版权所有人所有，本APP采用的非本站原创文章及图片等内容无法一一和版权者联系，如果本网所选内容的文章作者及编辑认为其作品不宜上网供大家浏览，或不应无偿使用请及时用电子邮件或电话通知我们，以迅速采取适当措施，避免给双方造成不必要的经济损失。';
const disclaimerText2 = '\n\r\r\r\r\r\r对于已经授权本APP独家使用并提供给本站资料的版权所有人的文章、图片等资料，如需转载使用，需取得本站和版权所有人的同意。本APP所刊发、转载的文章，其版权均归原作者所有，如其他媒体、网站或个人从本网下载使用，请在转载有关文章时务必尊重该文章的著作权，保留本网注明的“稿件来源”，并自负版权等法律责任。';


class DisclaimerMsg extends StatefulWidget {
  final State pWidget;
  DisclaimerMsg({ Key key, this.pWidget }) : super(key: key);
  DisclaimerMsgState createState() => DisclaimerMsgState();
}

class DisclaimerMsgState extends State<DisclaimerMsg> {
  var _valBool = false;
  var _page;
  //CollectionControlModel _collectionControl = new CollectionControlModel();
  //List<CollectionGeneral> _collectionList = [];
  //  void init(BuildContext context) {
  //    Toast.show(context: context, message: "👉 APP免责声明",cb:showAlertDialog);
  //  }

  @override
  void initState() {
    super.initState();
//    _collectionList.clear();
//    _collectionControl.getAllCollection().then((resultList) {
//      resultList.forEach((item) {
//        _collectionList.add(item);
//        print('=============db=========${item}');
//      });
//    });
    _page = widget.pWidget;
  }



  void refs(bool value){
    if(this.mounted){
      setState(() {
        _valBool=value;
        _page.save(value);
      });

//      _collectionControl
//          .insert(CollectionGeneral(key: 'disclaimer', values: value.toString()))
//          .then((result) {
//            print('result2====${result}');
//          }
//      );
    }
  }

  void showAlertDialog(BuildContext context) {
//    new Future.delayed(Duration(seconds: 5)).then((value) {
//      Navigator.of(context).pop();
//    });
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('免责声明'),
          content:SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 10.0),
                      //width: 100,
                      height: 35,
                      child: Text('免责声明',style:TextStyle(fontSize: 18,fontWeight:FontWeight.w700 )),
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('assets/images/paimaiLogo.png')
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                        ),
                          //alignment: Alignment.bottomRight,
                      )
                    ),
                    SizedBox(height:20),
                    Text(disclaimerText1),
                    Text(disclaimerText2),
                  ],
              ),
            ),
          shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)), // 圆角
          actions: <Widget>[
        Container(
          width: 270,
          alignment: Alignment.centerLeft,
          padding: new EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
          child:
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              //crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      tristate:false,
                      value: _valBool,
                      onChanged: (bool bol) {
                        refs(bol);
                        Navigator.of(context).pop(); // here I pop to avoid multiple Dialogs
                        showAlertDialog(context); //here i call the same function
                      }
                    ),
                    Text('不再自动提示',style:TextStyle(fontSize: 14)),
                  ],
                ),
                new Flexible(
                  flex: 1,
                  child: Container(width: 100,)
                ),
                  FlatButton(
                    child: Text('知道了',style:TextStyle(fontSize: 16,color: Colors.white)),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
              ]
//                SizedBox(
//                  width:150,
//                  height:55,
//                  child: CheckboxListTile(
//                      title: Text('不再显示',style:TextStyle(fontSize: 14)),
//                      controlAffinity: ListTileControlAffinity.leading,
//                      activeColor: Colors.red,
//                      value: _valBool,
//                      onChanged: (bool value) {
//                        refs(value);
//                        Navigator.of(context).pop(); // here I pop to avoid multiple Dialogs
//                        showAlertDialog(context); //here i call the same function
//                      }
//                    )
//                  //secondary: const Icon(Icons.hourglass_empty),
//                ),
//                Checkbox(
//                  activeColor: Colors.red,
//                  tristate:false,
//                  value: _valBool,
//                  onChanged: (bool bol) {
//                    refs(bol);
//                    Navigator.of(context).pop(); // here I pop to avoid multiple Dialogs
//                    showAlertDialog(context); //here i call the same function
//                  }
//                ),
//                Text('不再显示',style:TextStyle(fontSize: 14)),
//                FlatButton(
//                  child: Text('知道了',style:TextStyle(fontSize: 16,color: Colors.green)),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                ),
//              ],
            )
          )],
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        showAlertDialog(context);
      },
      child: Stack(
        //alignment: const Alignment(1.6, 1.6),
        children: [
          new Container(
            width:90.0,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              borderRadius:new BorderRadius.horizontal(right: Radius.circular(10)),
              color: Colors.black45,
            ),
            child: new Text(
              '🔔 免责声明',
              style: new TextStyle(
                fontSize: 14.0,
                //fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget build2(BuildContext context) {
    return Container(
        padding: new EdgeInsets.all(0.0),
        alignment:Alignment.centerRight,
        child:FlatButton(
          //padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: new Text(
              '👉 APP免责声明',
              style: new TextStyle(
                fontSize: 12.0, //textsize
                color: Colors.black54, // textcolor
              ),
            ),
            //color: Theme.of(context).accentColor,
            color: Theme.of(context).accentColor,
            //elevation: 0.0,//shadow
            //splashColor: Colors.blueGrey,
            onPressed: () {
              showAlertDialog(context);
              //Toast.show(context: context, message: "👉 APP免责声明",cb:showAlertDialog);
            })
    );
  }
}

class Toast {
  static void show({@required BuildContext context, @required String message,Function cb}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.12,
          right:5.0,
          child:RaisedButton(
              padding: new EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: new Text(
                '👉 APP免责声明',
                style: new TextStyle(
                  fontSize: 14.0, //textsize
                  color: Colors.black54, // textcolor
                ),
              ),
              //color: Theme.of(context).accentColor,
              color: Colors.red,
              //elevation: 0.0,//shadow
              //splashColor: Colors.blueGrey,
              onPressed: () {
                if(cb is Function){
                  cb(context);
                }
              })
      );
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    new Future.delayed(Duration(seconds: 2)).then((value) {
      //overlayEntry.remove();
    });
  }
}