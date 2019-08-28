///
/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/4/28
/// Time: 3:52 PM
/// email: zhu.yan@alibaba-inc.com
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './industry_bloc.dart';
/// import './industry_event.dart';
import './industry_state.dart';

final SuggestionBloc suggestion = SuggestionBloc();

class IndustryPage extends StatefulWidget {
  final Function itemTitle;
  IndustryPage({Key key,this.itemTitle}) : super(key: key);

  @override
  _IndustryState createState() => _IndustryState();
}

class _IndustryState extends State<IndustryPage> {
  Widget renderItem(state) {
    if (state is SuggestionUninitialized) {
      return Center(
        child: Text('暂无内容'),
      );
    } else if (state is SuggestionLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is SuggestionError) {
      return Center(
        child: Text('出现错误'),
      );
    } else if (state is SuggestionLoaded) {
      if (state.res.length == 0) {
        return Center(
          child: Text('没有适合的结果,更换查询条件试试'),
        );
      }else {
        if (widget.itemTitle is Function) {
          return widget.itemTitle(state);
        }
      }
    }
    return Center(
        child: Text('没有适合的结果,更换查询条件试试')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder(
              bloc: suggestion,
              builder: (BuildContext context, SuggestionState state){
                /// print('BlocBuilder----${state}');
                return renderItem(state);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //suggestion.dispose();//添加这个第二次进入会失灵
    super.dispose();
  }
}