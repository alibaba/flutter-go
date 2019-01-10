import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rookie_book/common/list_view_item.dart';
//import 'package:flutter_rookie_book/components/CompList.dart';
import 'package:flutter_rookie_book/components/ListRefresh.dart' as listComp;
import 'package:flutter_rookie_book/components/Pagination.dart';

import './widgetFeature/FirstPageItem.dart';
import '../common/net_utils.dart';

import 'package:flutter_rookie_book/common/iconNames.dart';
import '../common/sql.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    const emojis = ['👲'];
    var smallParts_Color = Colors.primaries[index % Colors.primaries.length];
    var smallParts_icon = IconNames.Names[index % IconNames.Names.length];
    var smallParts_emojis = IconNames.Names[index % IconNames.Names.length];

    var myTitle = '${item.title}';
    var myUsername = '${'👲'}: ${item.username} ';
    var codeUrl = '${item.detailUrl}';

    return new ListViewItem(itemUrl:codeUrl,itemTitle: myTitle,data: myUsername,);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          new Container(
            child: new Pagination(),
          ),
          SizedBox(height: 2, child:Container(color: Theme.of(context).primaryColor)),
          new Expanded(
            //child: new List(),
            child: listComp.ListRefresh(getIndexListData,makeCard)
          ),
        ]

    );
  }
}


