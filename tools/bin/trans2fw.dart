/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/6/9
 * Time: 10:15 AM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:dart_inquirer/dart_inquirer.dart';
import 'package:console/console.dart';
import 'package:path/path.dart' as path;

const defaultPath = "";
var projectPath = (Directory.current.uri).toString();

void main() async {
  qus_ans();
}

void qus_ans() async {
  List<Question> questions = [
    // ListQuestion('select', format("{@green}从上面的选项中选择你的路径类型{@normal}"),
    //     ['项目目录', '系统根目录']),
    InputQuestion('path', '请输入需要转换的文件目录(相对于项目目录):',
        skipIf: (Map ctx) => ctx["confirm"] == true),
    ConfirmQuestion('cover', '是否覆盖原有文件 ?', preferN: true),
  ];
  Prompt prompt = Prompt(questions);
  Map answers = await prompt.execute();
  String filePath = answers["path"];
  String select = answers['select'];
  bool cover = answers['cover'];

  ///print(Seperator('='));
  print(answers);

  // if (select == '项目目录') {
  //   filePath = projectPath + filePath;
  // }

  if (answers["path"] is String && (answers["path"] as String).isNotEmpty) {
    print("使用输入文件目录:${filePath}");
    printFilesAync(filePath, cover);
  } else if (!answers["confirm"] && answers["default"]) {
    print("使用默认文件目录:${defaultPath}");
    printFilesAync(defaultPath, cover);
  } else {
    print(format("{@red}放弃转换!{@normal}"));
  }
}

void printFilesAync(String path, bool cover) async {
  try {
    var directory = new Directory(path);
    List<FileSystemEntity> files = directory.listSync();
    if (files.length == 0) {
      print(format("{@yellow}目录为空！{@normal}"));
      return;
    }
    for (var f in files) {
      var bool = FileSystemEntity.isFileSync(f.path);
      if (!bool) {
        //print('1::${bool}::${f.path}::${files.length}');
        await printFilesAync(f.path, cover);
      } else if (f.path.indexOf('.dart') != -1) {
        print('被转换的文件::${f.path}::${files.length}');
        var newPath = (f.path).replaceAll(new RegExp('.dart'), '-copy.dart');
        File newfile = new File(newPath);
        File oldfile = new File(f.path);
        File output = cover ? oldfile : newfile;

        List<String> lines = oldfile.readAsLinesSync();

        var result = '';
        lines.forEach((l) => {
              if (l.trim().indexOf('package:flutter/material.dart') >= 0)
                {result += "import 'package:flutter_web/material.dart';\n"}
              else if (l.trim().indexOf('package:flutter/widgets.dart') >= 0)
                {result += "import 'package:flutter_web/widgets.dart';\n"}
              else if (l.trim().indexOf('package:flutter/cupertino.dart') >= 0)
                {result += "import 'package:flutter_web/cupertino.dart';\n"}
              else if (l.trim().indexOf('package:flutter/services.dart') >= 0)
                {result += "import 'package:flutter_web/services.dart';\n"}
              else if (l.trim().indexOf('package:flutter/rendering.dart') >= 0)
                {result += "import 'package:flutter_web/rendering.dart';\n"}
              else if (l.trim().indexOf('dart:ui') >= 0)
                {result += "import 'package:flutter_web_ui/ui.dart';\n"}
              else
                {result += '${l}\n'}
            });
        output.writeAsStringSync(result);
        //newfile.writeAsStringSync(result);
        ///await newfile.create();
        //await newfile.create();
        ///file.createSync();
        ///await oldfile.delete();
      }
    }
  } catch (e) {
    print(format("{@red}目录不存在！{@normal}") + ':${path}');
  }
}
