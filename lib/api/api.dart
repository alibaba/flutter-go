class Api{
  static const String BASE_URL = 'http://30.10.29.190:6001/';
  // static const String BASE_URL = 'http://flutter-go.alibaba.net/';

  static const String DO_LOGIN = BASE_URL+'doLogin';//登陆

  static const String CHECK_LOGIN = BASE_URL+'checkLogin';//验证登陆
  
  static const String LOGOUT = BASE_URL+'logout';//退出登陆

  static const String GET_USER_INFO = BASE_URL+'getUserInfo';//获取用户信息

  static const String RedirectIp = 'http://100.81.211.172/';
}