import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'dart:async';
import 'package:flutter_go/blocs/industry_main.dart' as Industry;
import 'package:flutter_go/blocs/industry_event.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/routers/routers.dart';

final _industryPage = Industry.IndustryPage(itemTitle: (state){
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        dense: true,
        leading: Icon(
          Icons.bookmark_border,
          size: 32,
        ),
        title: Text(
          state.res[index].title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(state.res[index].source),
        onTap: () {
          // 在这里对选中的结果进行解析，因为我目前是用golang实现的，所以就没贴代码了。
          print(state.res[index].source);
          final itemTitle = state.res[index].title;
          final itemUrl = state.res[index].source;
          Application.router.navigateTo(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(itemTitle)}&url=${Uri.encodeComponent(itemUrl)}');
        },
      );
    },
    itemCount: state.res.length,
  );
});

final suggestion = Industry.suggestion;
final searchBarPage = SearchBarPage();

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// print('suggestion::${Industry.suggestion}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 52), // 44 is the height
        child: AppBar(title: searchBarPage)
      ),
      //body: ProgressView(),
      body: _industryPage,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          //print('searchBarPage=====>${controller.text}');
          //print('searchBarPage=====>${that.getResultsDebounced}');
          if(that is _SearchBarPageState && that.getResultsDebounced is Function && controller.text is String ) {
            that.getResultsDebounced(controller.text);
          }
        },
      ),
    );
  }
}

/// 加载loading
class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  SizedBox(
        width: 24.0,
        height: 24.0,
        child:  CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}

class SearchBarPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>  _SearchBarPageState();
}


final TextEditingController controller = TextEditingController();
var that;
class _SearchBarPageState extends State<SearchBarPage> {
  @override
  void initState() {
    super.initState();
    that = this;
  }

  Timer _resultsTimer;
  bool _loading = false;
  String oldKey;
  /// 防抖函数
  Future getResultsDebounced(String text) async {
    if(oldKey == text){
      print('请求内容重复');
      return;
    }
    if (text == '' || !mounted) {
      return;
    }
    _loading = true;
    if (_resultsTimer != null && _resultsTimer.isActive) {
      _resultsTimer.cancel();
    }
    _resultsTimer = new Timer(new Duration(milliseconds: 400), () async {
      _loading = true;
      if(mounted){
        suggestion.dispatch(SuggestionFetch(query: text));
      }
      oldKey = text;
    });
  }


  void onSearchTextChanged(String text){
    print('onSearchTextChanged:${text}');
    //suggestion.dispatch(SuggestionFetch(query: text));
    getResultsDebounced(text);
  }

  @override
  void dispose() {
    print('dispose');
    suggestion.dispatch(SuggestionClearFetch());
    //controller.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        //color: Colors.amber,
        child: Padding(
          //padding: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top,),
          padding: EdgeInsets.all(0.0),
          child: Container(
            //height: 162.0,
            child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: 5.0,),
                          Icon(Icons.search, color: Colors.grey,size: 18.0,),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: TextField(
                                controller: controller,
                                decoration:  InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 0.0),
                                    hintText: '搜索全局flutter知识库',
                                    hintStyle:TextStyle(fontSize: 12.0),
                                    border: InputBorder.none
                                ),
                                onChanged: onSearchTextChanged,
                              ),
                            ),
                          ),
                           IconButton(
                            icon: Icon(Icons.cancel),
                            color: Colors.grey,
                            iconSize: 18.0,
                            onPressed: () {
                              controller.clear();
                              // onSearchTextChanged('');
                            },
                          ),
                        ],
                      ),
                    )
                )
            ),
          ),
        ),
      );
  }
}