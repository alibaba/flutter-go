/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 7:17 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'dart:async';
import 'package:bloc/bloc.dart';

import './search_event.dart';
import './search_state.dart';
import './search_api.dart';


/// 这里导入api类与上面的SearchEvent与SearchState文件

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchUninitialized();

  @override
  Stream<SearchState> mapEventToState(SearchEvent event,) async* {
    if (event is SearchFetch) {
      try {
        yield SearchLoading();
        final res = await api.search(event.query);
        yield SearchLoaded(res: res);
      } catch (_) {
        yield SearchError();
      }
    }
  }
}