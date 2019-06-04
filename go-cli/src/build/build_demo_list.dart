import 'dart:io';
import '../../utils/util.dart';
import '../config.dart';
import '../exception/demo.dart';


Future<List> buildDemoListJson() async {
  List<FileSystemEntity> childList = await readeDirChildren(TARGET_FILE_DIC, false);
  for(FileSystemEntity entity in childList) {
    //文件、目录和链接都继承自FileSystemEntity
    //FileSystemEntity.type静态函数返回值为FileSystemEntityType
    //FileSystemEntityType有三个常量：
    //Directory、FILE、LINK、NOT_FOUND
    //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    Uri url = entity.uri;
    if (await FileSystemEntity.isDirectory(entity.path)) {
      checkDemo(entity.path);

    }
  }
  return Future(() => childList);
//  return ;
}

Future<bool> checkDemo(String path) async {
  List files = [
    'index.dart',
    '.demo.json',
    'src/'
  ];
  for (String name in files) {
    bool isDic = name.indexOf('/') != -1;
    bool isExist ;
    String detailPath = '$path/$name';
    if (isDic) {
      isExist = await Directory(detailPath).exists();
    } else {
      isExist = await File(detailPath).exists();
    }
    if (!isExist) {
     throw new InvalidDemo('$path$name not exit');
    }
  }
  return Future(() => false);
}
main() {
  buildDemoListJson();
//  checkDemo('lib/page_demo_package/button_sanfan_72af2949_22ae_4241_9c8a_5c9e1f92b096/');
}