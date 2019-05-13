/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 3:37 PM
 * email: zhu.yan@alibaba-inc.com
 */
abstract class SuggestionState {}

class SuggestionError extends SuggestionState {
  @override
  String toString() => 'SuggestionError：获取失败';
}

class SuggestionUninitialized extends SuggestionState {
  @override
  String toString() => 'SuggestionUninitialized：未初始化';
}

class SuggestionLoading extends SuggestionState {
  @override
  String toString() => 'SuggestionLoading ：正在加载';
}

class SuggestionLoaded extends SuggestionState {
  final List res;

  SuggestionLoaded({
    this.res,
  });

  @override
  String toString() => 'SuggestionLoaded：加载完毕';
}
