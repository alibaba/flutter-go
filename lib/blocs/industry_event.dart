///
/// Created with Android Studio.
/// User: 一晟
/// Date: 2019/4/28
/// Time: 3:35 PM
/// email: zhu.yan@alibaba-inc.com
///
abstract class SuggestionEvent {}

class SuggestionFetch extends SuggestionEvent {
  final String query;

  SuggestionFetch({this.query});

  @override
  String toString() => 'SuggestionFetch:获取关键字提示事件';
}

class SuggestionClearFetch extends SuggestionEvent {
  final String query;

  SuggestionClearFetch({this.query});

  @override
  String toString() => 'SuggestionClearFetch:清空界面';
}