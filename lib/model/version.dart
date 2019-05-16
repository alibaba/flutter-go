class Data {
  String version;
  String name;

  Data.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        name = json['name'];

  @override
  String toString() {
    return 'name: $name ,version: $version';
  }
}

class Version {
  Data data;
  int status;
  bool success;

  Version.formJson(Map<String, dynamic> json)
      : status = json['status'],
        success = json['success'],
        data = Data.fromJson(json['data']);

  @override
  String toString() {
    return 'status: $status ,success: $success,date: ${data.toString()}';
  }
}
