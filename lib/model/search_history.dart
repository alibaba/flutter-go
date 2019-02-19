///
/// Created with Android Studio.
/// User: 三帆
/// Date: 18/02/2019
/// Time: 14:19
/// email: sanfan.hx@alibaba-inc.com
/// target: 搜索WidgetDemo中的历史记录model
///

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_go/utils/shared_preferences.dart';


class SearchHistory {
  final String name;
  final String targetRouter;

  SearchHistory({@required this.name, @required this.targetRouter});
}

class SearchHistoryList {
  static SpUtil _sp;
  static SearchHistoryList _instance;
  static List<SearchHistory> _searchHistoryList = [];

  static SearchHistoryList _getInstance(SpUtil sp) {
    if (_instance == null) {
      _sp = sp;
      String json = sp.get(SharedPreferencesKeys.searchHistory);
      _instance = new SearchHistoryList.fromJSON(json);
    }
    return _instance;
  }

  factory SearchHistoryList([SpUtil sp]) {
    if (sp == null && _instance == null) {
      print(new ArgumentError(
          ['SearchHistoryList need instantiatied SpUtil at first timte ']));
    }
    return _getInstance(sp);
  }

//  List<SearchHistory> _searchHistoryList = [];

  // 存放的最大数量
  int _count = 10;

  SearchHistoryList.fromJSON(String jsonData) {
    _searchHistoryList = [];
    if (jsonData == null) {
      return;
    }
    List jsonList = json.decode(jsonData);
    jsonList.forEach((value) {
      _searchHistoryList.add(SearchHistory(
          name: value['name'], targetRouter: value['targetRouter']));
    });
  }

  List<SearchHistory> getList() {
    return _searchHistoryList;
  }

  clear() {
    _sp.remove(SharedPreferencesKeys.searchHistory);
    _searchHistoryList = [];
  }

  save() {
    _sp.putString(SharedPreferencesKeys.searchHistory, this.toJson());
  }

  add(SearchHistory item) {
    print("_searchHistoryList> ${_searchHistoryList.length}");
    for (SearchHistory value in _searchHistoryList) {
      if (value.name == item.name) {
        return;
      }
    }
    if (_searchHistoryList.length > _count) {
      _searchHistoryList.removeAt(0);
    }
    _searchHistoryList.add(item);
    save();
  }

  toJson() {
    List<Map<String, String>> jsonList = [];
    _searchHistoryList.forEach((SearchHistory value) {
      jsonList.add({'name': value.name, 'targetRouter': value.targetRouter});
    });
    return json.encode(jsonList);
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.toJson();
  }
}
