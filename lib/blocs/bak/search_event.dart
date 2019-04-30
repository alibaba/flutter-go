/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 7:18 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
abstract class SearchEvent {}

class SearchFetch extends SearchEvent {
  final String query;

  SearchFetch({this.query});

  @override
  String toString() => 'SearchFetch：获取搜索结果事件';
}