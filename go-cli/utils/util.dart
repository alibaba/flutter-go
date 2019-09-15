import 'dart:io';
import 'dart:math';
Future<bool> createFile(String path) async {
  final tempDic = new Directory(path);
  var exits = await tempDic.exists();

  if (exits) {
    print("文件当前已存在");
    return Future(() => false);
  }

  await tempDic.createSync(recursive: true);
  return Future(() => true);
}
Future<String> readeFile(String path) async {
  String content = await new File(path).readAsString();
  return Future(() => content);
}

// 该文件调用的时候. 必须存在父级文件夹
Future<void> writeContent2Path(String path,String fileName, String content) async {
  var file = File('$path/$fileName');
  var sink = file.openWrite();
  sink.write(content);
  await sink.flush();
  await sink.close();
  return Future.value();
}
String generateId() {
  int d = DateTime.now().millisecondsSinceEpoch;
  var random = new Random(1);
  var template = 'xxxxxxxx_xxxx_4xxx_yxxx_xxxxxxxxxxxx';
  var id = template.replaceAllMapped(new RegExp(r"[x|y]"), (c) {
    var r = ((d + random.nextDouble() * 16) % 16).toInt();
    d = d ~/ 16;
    var t = c.group(0) == 'x' ? r : (1 & 0x3 | 0x8);
    return t.toRadixString(16);
  });
  return id;
}

/// 该文件调用的时候. 必须存在父级文件夹
/// @param path 目录地址
/// @param recursive 是否显示子目录或者子文件
Future<List<FileSystemEntity>> readeDirChildren(String path, [bool recursive = false]) async {
  try {
    var dirParent = Directory(path);
    Stream<FileSystemEntity> entityList = dirParent.list(recursive: false, followLinks: false);
    List<FileSystemEntity> fileChildren = [];

    await for(FileSystemEntity entity in entityList) {
      fileChildren.add(entity);
    }

    return Future(() => fileChildren);
  } catch (e) {
    print('读取文件失败 ${e.toString()}');
    return Future(() => []);
  }
}

//void main() {
//  readeFile('/Users/ontwo/Documents/ali/flutter/flutter-common-widgets-app/LICENSE');
//}