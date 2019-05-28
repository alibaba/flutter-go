import 'dart:io';
import '../../utils/util.dart';
import '../config.dart';


Future<List> buildDemoListJson() async {
  List<FileSystemEntity> childList = await readeDirChildren(TARGET_FILE_DIC, false);
  for(FileSystemEntity entity in childList) {
    //文件、目录和链接都继承自FileSystemEntity
    //FileSystemEntity.type静态函数返回值为FileSystemEntityType
    //FileSystemEntityType有三个常量：
    //Directory、FILE、LINK、NOT_FOUND
    //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    Uri url = entity.uri;
    print('${entity.path} is FIle: ${url.toString()} ${ await FileSystemEntity.isDirectory(entity.path)}}');
  }
  return Future(() => childList);
//  return ;
}

Future<bool> checkDemo(String path) async {
  List<FileSystemEntity> childList = await readeDirChildren(path, true);
  for(FileSystemEntity entity in childList) {
    //文件、目录和链接都继承自FileSystemEntity
    //FileSystemEntity.type静态函数返回值为FileSystemEntityType
    //FileSystemEntityType有三个常量：
    //Directory、FILE、LINK、NOT_FOUND
    //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    Uri url = entity.uri;

    print('children ${entity.path}');
  }
  return Future(() => false);
}
main() {
//  buildDemoListJson();
  checkDemo('lib/page_demo_package/_na_6397dd08_22ae_4241_9c8a_5c9e1f92b096/');
}