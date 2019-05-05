/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 7:19 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:suiyi/blocs/search/bloc.dart';
import './search_event.dart';
import './search_state.dart';
import './search_bloc.dart';


class SearchWidget extends StatefulWidget {
  final SearchDelegate delegate;
  final String query;
  SearchWidget({this.delegate, this.query});
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final SearchBloc _search = SearchBloc();
  String old;
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('1:${old}');
    print('2:${widget.query}');
    if (old != widget.query) {
      _search.dispatch(SearchFetch(query: widget.query));
      old = widget.query;
    }
    return BlocBuilder(
      bloc: _search,
      builder: (BuildContext context, SearchState state) {
        print('-------${state}');
        if (state is SearchUninitialized || state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchError) {
          return Center(
            child: Text('获取失败'),
          );
        } else if (state is SearchLoaded) {
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
    );
  }
}