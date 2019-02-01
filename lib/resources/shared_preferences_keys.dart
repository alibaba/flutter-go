/**
 * Created with Android Studio.
 * User: 三帆
 * Date: 31/01/2019
 * Time: 18:13
 * email: sanfan.hx@alibaba-inc.com
 * tartget:  xxx
 */

enum DateType {
  Int,
  Double,
  Bool,
  String,
  Dynamic
}

class spKey {
  String name;
  DateType type;

  spKey({this.name, this.type});
}

class sharedPreferencesKeys {
  static spKey loginWelcome = spKey(name: 'loginWelcone', type: DateType.Bool);
}

