class UserInformation {
  String username;
  int id;
  String avatarPic;
  String themeColor;

  UserInformation({
    this.avatarPic,
    this.id,
    this.themeColor,
    this.username,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    if(json['name'] == null){
      name = json['url_name'];
    }
    return UserInformation(
        avatarPic: json['avatar_pic'],
        id: int.parse(json['id']),
        username: name,
        themeColor: json['theme_color']);
  }
}
