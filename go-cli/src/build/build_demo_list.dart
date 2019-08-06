import 'dart:io';
import 'dart:convert';
import '../../utils/util.dart';
import '../config.dart';
import '../exception/demo.dart';


Future<List> buildDemoListJson() async {
  List<FileSystemEntity> childList = await readeDirChildren(TARGET_DEMO_DIC, false);
  List<String> demoPathList = [];
  List<Map<String, dynamic>> detailList = []; // 存放所有demo的详情的列表
  for(FileSystemEntity entity in childList) {
    //文件、目录和链接都继承自FileSystemEntity
    //FileSystemEntity.type静态函数返回值为FileSystemEntityType
    //FileSystemEntityType有三个常量：
    //Directory、FILE、LINK、NOT_FOUND
    //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    Uri url = entity.uri;
    if (await FileSystemEntity.isDirectory(entity.path)) {
      try {
        await checkDemo(entity.path);
        demoPathList.add(entity.path);
      } on InvalidDemo catch (e) {
        print("不存在 $e");
      }
    }
  }

  for (String dicPath in demoPathList) {
    String target = '$dicPath/.demo.json';
    String jsonString = await readeFile(target);
    try  {
      Map<String, dynamic> item = json.decode(jsonString);
      detailList.add(item);
    } catch (err) {
      print("err $err");
      throw new Exception('$dicPath');
    }
  }
  print("本次编译: 获取${detailList.length}条demo数据");

  String demoTplString = renderDemosDart(detailList);

  // 生成 page_demo_package/index.dart
  writeContent2Path(TARGET_DEMO_DIC, 'index.dart', demoTplString.replaceAll(new RegExp('-'), '_'));
  // 生成 page_demo_package/.demo.dart
  writeContent2Path(TARGET_DEMO_DIC, '.demo.json', json.encode(detailList));
  return Future(() => childList);
//  return ;
}

String renderDemosDart(List<Map<String, dynamic>> data) {
  // 自定义前缀 避免出现数字非法字符等
  String pre = "StandardDemo";
  String head = '';
  String foot = 'var demoObjects = { \r\n';

  for (int i = 0; i < data.length; i++) {
    Map<String, dynamic> item = data[i];
    String demoImportName = '${item['name']}_${item['id']}';
    head += "import '${item['name']}_${item['author']}_${item['id']}/index.dart' as StandardDemo_$demoImportName;\r\n";

    foot += "  '${item['id']}': ${pre}_${demoImportName}.demoWidgets";

    if (i != data.length - 1) {
      foot += ',\r\n';
    }

  }
  foot += "\r\n};";
  
  return head + foot;
}
Future<bool> checkDemo(String path) async {
  List files = [
    'index.dart',
    '.demo.json',
    'src/'
  ];
  bool success = true;
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
  return Future(() => true);
}
