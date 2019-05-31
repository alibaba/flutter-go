class CollectionEvent{
  final String widgetName;
  final String router;
  final bool isRemove;
  // token uid...
  CollectionEvent(this.widgetName,this.router,this.isRemove);
}

class UserGithubOAuthEvent{
  final String loginName;
  final String token;
  final bool isSuccess;
  UserGithubOAuthEvent(this.loginName,this.token,this.isSuccess);
}