class UserInfo {
  String username;
  int id;
  String avatarPic;
  String themeColor;
  String urlName;

  UserInfo({
    this.avatarPic,
    this.id,
    this.themeColor,
    this.urlName,
    this.username,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
        avatarPic: json['avatar_pic'],
        id: int.parse(json['id']),
        username: json['name'],
        themeColor: json['theme_color'],
        urlName: json['url_name']);
  }
}
