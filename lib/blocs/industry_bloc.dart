/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/4/28
 * Time: 5:19 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'dart:async';
import 'package:bloc/bloc.dart';
import './industry_api.dart';
import './industry_event.dart';
import './industry_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  @override
  SuggestionState get initialState => SuggestionUninitialized();
  @override
  Stream<SuggestionState> mapEventToState(SuggestionEvent event)async* {
  //Stream<SuggestionState> mapEventToState(SuggestionState currentState, SuggestionEvent event,) async* {
    if (event is SuggestionFetch) {
      //print('event==>${event}');
      try {
        yield SuggestionLoading();
        final res = await api.suggestion(event.query);
        // print('res====>${res}');
        yield SuggestionLoaded(res: res);
      } catch (_) {
        yield SuggestionError();
      }
    }
    if (event is SuggestionClearFetch) {
      //print('event==>${event}');
      try {
        yield SuggestionUninitialized();
      } catch (_) {
        yield SuggestionError();
      }
    }
  }
}
