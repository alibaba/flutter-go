
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

///
/// 用来做shared_preferences的存储
class SpUtil {
  static SpUtil _instance;
  static Future<SpUtil> get instance async {
    return await _getInstance();
  }

  static SharedPreferences _spf;


  SpUtil._();

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<SpUtil> _getInstance() async  {
    if (_instance == null) {
      _instance = new SpUtil._();
      await _instance._init();

    }
    return _instance;
  }

  static bool _beforCheck() {
    String a;
    if (_spf == null) {
      return throw new StateError("SharedPreferences must be initialized first, but the insurance is null;");
    }
  }

  static Set<String> getKeys() {
    if (_beforCheck()) return null;
    return _spf.getKeys();
  }
  dynamic get(String key) {
    if (_beforCheck()) return null;
    return _spf.getKeys();
  }
  static String getString(String key) {
    if (_beforCheck()) return null;
    return _spf.getString(key);
  }

  static Future<bool> putString(String key, String value) {
    if (_beforCheck()) return null;
    return _spf.setString(key, value);
  }

  static bool getBool(String key) {
    if (_beforCheck()) return null;
    return _spf.getBool(key);
  }

  static Future<bool> putBool(String key, bool value) {
    if (_beforCheck()) return null;
    return _spf.setBool(key, value);
  }

  static int getInt(String key) {
    if (_beforCheck()) return null;
    return _spf.getInt(key);
  }

  static Future<bool> putInt(String key, int value) {
    if (_beforCheck()) return null;
    return _spf.setInt(key, value);
  }

  static double getDouble(String key) {
    if (_beforCheck()) return null;
    return _spf.getDouble(key);
  }

  static Future<bool> putDouble(String key, double value) {
    if (_beforCheck()) return null;
    return _spf.setDouble(key, value);
  }

  static List<String> getStringList(String key) {
    return _spf.getStringList(key);
  }

  static Future<bool> putStringList(String key, List<String> value) {
    if (_beforCheck()) return null;
    return _spf.setStringList(key, value);
  }

  static dynamic getDynamic(String key) {
    if (_beforCheck()) return null;
    return _spf.get(key);
  }



  static Future<bool> remove(String key) {
    if (_beforCheck()) return null;
    return _spf.remove(key);
  }

  static Future<bool> clear() {
    if (_beforCheck()) return null;
    return _spf.clear();
  }
}
