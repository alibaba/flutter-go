import 'dart:io';
import 'dart:convert';
import 'package:mustache/mustache.dart';
import 'package:path/path.dart' as p;
import '../../utils/util.dart';
import '../config.dart';
import '../exception/demo.dart';


String prettyJson(Map json) {
  String res = "{";
  json.forEach((k, v) {
    res += (
        "\t'$k': '$v'");
  });
  res +='}';
  return res;
}


Future<List> buildPageListJson() async {
  List<FileSystemEntity> childList = await readeDirChildren(TARGET_PAGE_DIC, false);
  List<String> pagePathList = [];
  List<Map<String, dynamic>> detailList = []; // 存放所有demo的详情的列表
  int errCount = 0;
  int pageCount = 0;
  for(FileSystemEntity entity in childList) {
    //文件、目录和链接都继承自FileSystemEntity
    //FileSystemEntity.type静态函数返回值为FileSystemEntityType
    //FileSystemEntityType有三个常量：
    //Directory、FILE、LINK、NOT_FOUND
    //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    if (await FileSystemEntity.isDirectory(entity.path)) {
      pageCount++;
      try {
        await checkPage(entity.path);
        pagePathList.add(entity.path);
      } on InvalidDemo catch (e) {
        errCount++;
        print("不存在 $e");
      }
    }
  }

  for (String dicPath in pagePathList) {
    String target = '$dicPath/.page.json';
    String jsonString = await readeFile(target);
    try  {
      Map<String, dynamic> item = json.decode(jsonString);
      detailList.add(item);
    } catch (err) {
      print("err $err");

      throw new Exception('$dicPath');
    }
  }
  print("本次编译: 总${pageCount}个界面, 成功${detailList.length}条, 失败${errCount}条");

  String demoTplString = renderPagesDart(detailList);
//
//  // 生成 page_demo_package/index.dart
  writeContent2Path(TARGET_PAGE_DIC, 'index.dart', demoTplString.replaceAll(new RegExp('-'), '_'));
//  // 生成 page_demo_package/.demo.dart
  writeContent2Path(TARGET_PAGE_DIC, '.pages.json', json.encode(detailList));
  return Future(() => childList);
//  return ;
}

String renderPagesDart(List<Map<String, dynamic>> data) {
  var source = '''

 {{# pages }}
import '{{ name }}_{{ author }}_{{ id }}/index.dart' as StandardPage_{{ name }}_{{ id }};
 {{/ pages }}
class StandardPages {
  Map<String, String> standardPages;
  Map<String, String> getPages() {
    return {
      "0": "0" {{# pages }},
     "{{ id }}" : StandardPage_{{ name }}_{{ id }}.getMd()
       {{/ pages }}
    };
  }
  List<Map<String, String>> getLocalList() {
    return [
      {}{{# pages }},
      { "id": "{{ id }}", "name": "{{ name }}", "email": "{{ email }}", "author": "{{ author }}"}
      {{/ pages }}
    ];
  }

}
	  
	''';
  var template = new Template(source, name: 'template-filename.html');


  // 自定义前缀 避免出现数字非法字符等
  Map<String, List> formatData = {
    "pages": data
  };

  String output = template.renderString(formatData);


return output;
  
}
Future<bool> checkPage(String path) async {
  List files = [
    'index.dart',
    'index.md',
    '.page.json'
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
  return Future(() => true);
}


Future<void> transformMd2Dart(String path)  async{
  print("pathLL: $path");
  String mdContent = await readeFile(p.absolute(path,'index.md'));


  String result = """
String getMd() {
  return \"\"\"
  ${mdContent}\"\"\";


}
  """;
  writeContent2Path(p.absolute(path), 'index.dart', result);
  return '';
}
//main() {
//  buildPageListJson();
//}


////
//// Created with Android Studio.
//// User: 三帆
//// Date: 25/05/2019
//// Time: 21:23
//// email: sanfan.hx@alibaba-inc.com
//// target: 该文件用在打包后的代码中.日常开发的时候, 获取markdown不走该目录
////
//import 'package:flutter/material.dart';
//import 'page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4/index.dart' as page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4;
//
//
//class StandardPages {
//  Map<String, String> standardPages;
//  Map<String, String> getPages() {
//    return {
//      'page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4': page1_hanxu_172ba42f_0520_401e_b568_ba7f7f6835e4.stringMd
//    };
//  }
//}

//var stringMd = """# page
//
//this is page markdown
//
//you can load demo like this
//
//```
//[demo: xxxid]
//```
//
//""";
//