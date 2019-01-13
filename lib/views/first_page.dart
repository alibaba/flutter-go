import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_go/common/list_view_item.dart';
import 'package:flutter_go/components/list_refresh.dart' as listComp;
import 'package:flutter_go/components/pagination.dart';
import 'package:flutter_go/components/first_page_item.dart';
import 'package:flutter_go/components/disclaimer_msg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/net_utils.dart';

GlobalKey<DisclaimerMsgState> key;

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  save(bool flag) async{
    //print('=============save=========$flag');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('disclaimer', flag.toString());
  }

  Future<String> get() async {
    var value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    value = prefs.getString('disclaimer');
    return value;
  }

  @override
  void initState() {
    super.initState();
    if(key == null) {
      //print('=============111=========${key}');
      delayed();
    }
    key = GlobalKey<DisclaimerMsgState>();

  }

  /*
  * 判断是否需要弹出免责声明,已经勾选过不在显示,就不会主动弹
  * */
  Future delayed() async {
    await new Future.delayed(const Duration(seconds: 1));
//    if (this.mounted) {
//      setState(() {
//        print('test=======>${key.currentState}');
//        key.currentState.showAlertDialog(context);
//        //key.currentState.init(context);
//      });
//    }
    Future<String> flag = get();
    flag.then((String value) {
      //print('=============get=========$value');
      if(value.toString() == 'false'){ // 如果没有勾选下次开启
        key.currentState.showAlertDialog(context);
      }
    });
  }

  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    const juejin_flutter = 'https://timeline-merger-ms.juejin.im/v1/get_tag_entry?src=web&tagId=5a96291f6fb9a0535b535438';
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    final _param  = {'page':pageIndex,'pageSize':20,'sort':'rankIndex'};

    var response = await NetUtils.get(juejin_flutter, params: _param);
    var responseList = response['d']['entrylist'];
    var  pageTotal = response['d']['total'];
    if (!(pageTotal is int) || pageTotal <= 0) {
      pageTotal = 0;
    }
    pageIndex += 1;
    List resultList = new List();
    for (int i = 0; i < responseList.length; i++) {
      try {
        FirstPageItem cellData = new FirstPageItem.fromJson(responseList[i]);
        resultList.add(cellData);
      } catch (e) {
        // No specified type, handles all
      }
    }
    Map<String, dynamic> result = {"list":resultList, 'total':pageTotal, 'pageIndex':pageIndex};
    return result;
  }

  Widget makeCard(index,item){

    var myTitle = '${item.title}';
    var myUsername = '${'👲'}: ${item.username} ';
    var codeUrl = '${item.detailUrl}';
    return new ListViewItem(itemUrl:codeUrl,itemTitle: myTitle,data: myUsername,);
  }

  headerView(){
    return
      Column(
        children: <Widget>[
        Stack(
        //alignment: const FractionalOffset(0.9, 0.1),//方法一
        children: <Widget>[
            Pagination(),
            Positioned(//方法二
            top: 10.0,
            left: 0.0,
            child: DisclaimerMsg(key:key,pWidget:this)
            ),
          ]),
        SizedBox(height: 1, child:Container(color: Theme.of(context).primaryColor)),
        SizedBox(height: 10),
        ],
      );

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Column(
        children: <Widget>[
//          new Stack(
//            //alignment: const FractionalOffset(0.9, 0.1),//方法一
//            children: <Widget>[
//            Pagination(),
//            Positioned(//方法二
//              top: 10.0,
//              left: 0.0,
//              child: DisclaimerMsg(key:key,pWidget:this)
//            ),
//          ]),
//          SizedBox(height: 2, child:Container(color: Theme.of(context).primaryColor)),
          new Expanded(
            //child: new List(),
            child: listComp.ListRefresh(getIndexListData,makeCard,headerView)
          )
        ]

    );
  }
}


