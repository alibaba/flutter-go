/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 7:13 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import './search_result.dart';

abstract class SearchState {}

class SearchError extends SearchState {
  @override
  String toString() => 'SearchError：获取失败';
}

class SearchUninitialized extends SearchState {
  @override
  String toString() => 'SearchUninitialized：未初始化';
}

class SearchLoading extends SearchState {
  @override
  String toString() => 'SearchLoading ：正在加载';
}

class SearchLoaded extends SearchState {
  final List<SearchResult> res;

  SearchLoaded({
    this.res,
  });

  @override
  String toString() => 'SearchLoaded：加载完毕';
}