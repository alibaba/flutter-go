import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class Demo extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      width: double.infinity,
      height: 600.0,
      child: Pulltorefresh(),
    );
  }
}

class Pulltorefresh extends StatefulWidget {
  @override
  _PulltorefreshState createState() => _PulltorefreshState();
}

class _PulltorefreshState extends State<Pulltorefresh> {
  List<Widget> datas=ListData.getList();
  RefreshController _controller=RefreshController(initialRefresh: false);

  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _controller.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1500));
    ItemModel model=ItemModel(getRandomColor(), Icons.airplanemode_active, "军事新闻", "俄军大秀战略",
        "酝酿已久的俄罗斯“中部-2019”战略演习于16日正式启动", 5000);

    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    this.datas.add(Item(getRandomColor(), model.icon, model.mainTitle, model.subTitle, model.des, model.readCount));
    if(mounted)
      setState(() {

      });
    _controller.loadComplete();
  }

  @override
  Widget build(BuildContext context) {

    Widget _itemBuilder(BuildContext context, int position) {

      return Card(child: this.datas[position]);

    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Pulltorefresh"),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowAlways,
          completeDuration: Duration(microseconds: 50),
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        controller: _controller,
        child: ListView.builder(itemBuilder: _itemBuilder,itemCount: this.datas.length),


      ),


    );
  }


  Color getRandomColor(){
    List<Color> colors=[Colors.deepOrange,Colors.amber,Colors.cyan,Colors.green,Colors.red,Colors.yellow];
    int randomValue=Random().nextInt(colors.length);
    if(randomValue==colors.length){
      randomValue=colors.length-1;
    }
    return colors[randomValue];

  }

}



class Item extends StatelessWidget {
  Color color;
  IconData icon;
  String mainTitle;
  String subTitle;
  String des;
  int readCount;

  Item(this.color, this.icon, this.mainTitle, this.subTitle, this.des,
      this.readCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      height: 90.0,
      child: Row(
        children: <Widget>[
          Container(
            width: 90.0,
            color: color,
            alignment: Alignment.center,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Text(mainTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0))),
                  Expanded(child: Text(subTitle, style: TextStyle(fontSize: 14.0))),
                  Expanded(
                      child: Text(
                        des,
                        style: TextStyle(fontSize: 13.0),
                        overflow: TextOverflow.ellipsis,
                      )),
                  Expanded(
                      child: Text("阅读量:${readCount.toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.redAccent))),
                ],
              ))
        ],
      ),
    );
  }
}

class ItemModel{
  Color _color;
  IconData _icon;
  String _mainTitle;
  String _subTitle;
  String _des;
  int _readCount;

  ItemModel(this._color, this._icon, this._mainTitle, this._subTitle, this._des,
      this._readCount);

  int get readCount => _readCount;

  set readCount(int value) {
    _readCount = value;
  }

  String get des => _des;

  set des(String value) {
    _des = value;
  }

  String get subTitle => _subTitle;

  set subTitle(String value) {
    _subTitle = value;
  }

  String get mainTitle => _mainTitle;

  set mainTitle(String value) {
    _mainTitle = value;
  }

  IconData get icon => _icon;

  set icon(IconData value) {
    _icon = value;
  }

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }


}

class ListData{
  static List<Widget> getList(){
    List<Widget> models=[];
    ItemModel model1= ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "俄军大秀战略",
        "酝酿已久的俄罗斯“中部-2019”战略演习于16日正式启动", 2999);
    ItemModel model2= ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "俄“中部”演习",
        "俄罗斯卫星网报道称，俄罗斯国防部长绍伊古表示，“中央-2019”战略演习是", 4588);
    ItemModel model3= ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "中国2.7万吨坞登舰",
        "据印度新德里电视台16日报道，印度海军发现7艘中国军舰在印度洋", 7777);
    ItemModel model4=  ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "针对中国？",
        "美国空军着力打造军用5G网络，5G+VR，飞行员无需上天就能操控战机；美军濒海", 8888);
    ItemModel model5=  ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "“凯旋”防空导弹系统",
        "俄罗斯卫星通讯社报道，俄罗斯北方舰队（Russian Northern Fleet）新闻处", 9999);
    ItemModel model6=  ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "火箭军还有骑兵连",
        "迅速对禁区“敌特分子”活动区域进行侦察定位,战斗小分队", 104754);
    ItemModel model7= ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "侦察兵跨越冰川",
        "在海拔5000多米的雪域高原，第77集团军某合成旅的侦察兵们正在进行野外驻训", 47545);
    ItemModel model8=  ItemModel(Colors.red, Icons.airplanemode_active, "军事新闻", "香港被护商船",
        "新京报快讯 据北海舰队官微消息：“感谢海军!”“祖国万岁!”，当地时", 124574);

    models.add(Item(model1.color, model1.icon, model1.mainTitle, model1.subTitle, model1.des, model1.readCount));
    models.add(Item(model2.color, model2.icon, model2.mainTitle, model2.subTitle, model2.des, model2.readCount));
    models.add(Item(model3.color, model3.icon, model3.mainTitle, model3.subTitle, model3.des, model3.readCount));
    models.add(Item(model4.color, model4.icon, model4.mainTitle, model4.subTitle, model4.des, model4.readCount));
    models.add(Item(model5.color, model5.icon, model5.mainTitle, model5.subTitle, model5.des, model5.readCount));
    models.add(Item(model6.color, model6.icon, model6.mainTitle, model6.subTitle, model6.des, model6.readCount));
    models.add(Item(model7.color, model7.icon, model7.mainTitle, model7.subTitle, model7.des, model7.readCount));
    models.add(Item(model8.color, model8.icon, model8.mainTitle, model8.subTitle, model8.des, model8.readCount));
    return models;
  }
}


