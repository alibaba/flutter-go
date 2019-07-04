class Api{
  // static const String BASE_URL = 'http://127.0.0.1:6001/';
  static const String BASE_URL = 'http://flutter-go.alibaba.net/';

  static const String DO_LOGIN = BASE_URL+'doLogin';//登陆

  static const String CHECK_LOGIN = BASE_URL+'checkLogin';//验证登陆
  
  static const String LOGOUT = BASE_URL+'logout';//退出登陆

  static const String VERSION = BASE_URL+'getAppVersion';//检查版本

  static const String GET_WIDGET_TREE = BASE_URL + 'getCateList';//获取widget列表树
}

