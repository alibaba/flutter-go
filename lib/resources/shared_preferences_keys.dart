// Created with Android Studio.
// User: 三帆
// Date: 31/01/2019
// Time: 18:13
// email: sanfan.hx@alibaba-inc.com
// target:  xxx
//

//enum DateType {
//  Int,
//  Double,
//  Bool,
//  String,
//  Dynamic
//}

//class spKey {
//  String name;
//  DateType type;
//
//  spKey({this.name, this.type});
//}

class SharedPreferencesKeys {
  /// boolean
  /// 用于欢迎页面. 只有第一次访问才会显示. 或者手动将这个值设为false
  static String showWelcome = 'loginWelcone';

  /// json
  /// 用于存放搜索页的搜索数据.
  /// [{
  ///  name: 'name'
  ///
  /// }]
  static String searchHistory = 'searchHistory';
}
