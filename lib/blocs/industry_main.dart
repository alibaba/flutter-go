/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 3:52 PM
 * email: zhu.yan@alibaba-inc.com
 */
import 'package:flutter/material.dart';
//import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './industry_bloc.dart';
import './industry_event.dart';
import './industry_state.dart';

//class Industry extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: '关键字提示',
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('关键字提示'),
//        ),
//        body: AppHome(),
//      ),
//    );
//  }
//}

class IndustryPage extends StatefulWidget {
  @override
  _IndustryState createState() => _IndustryState();
}

class _IndustryState extends State<IndustryPage> {
  final SuggestionBloc _suggestion = SuggestionBloc();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onSubmitted: (text) {
              _suggestion.dispatch(SuggestionFetch(query: text));
            },
          ),
          Expanded(
            child: BlocBuilder(
              bloc: _suggestion,
              builder: (BuildContext context, SuggestionState state) {
                print('-------${state}');
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
//                  return ListView.builder(
//                    itemBuilder: (BuildContext context, int index) {
//                      //return ListTile(title: Text(state.res[index]));
//                      return null;
//                    },
//                    itemCount: state.res.length,
//                  );
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
                        },
                      );
                    },
                    itemCount: state.res.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _suggestion.dispose();
    super.dispose();
  }
}