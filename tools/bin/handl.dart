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

//const defaultPath = "/Users/ryan/work/ali/github/flutter-study/flutter_web/examples/@ali-flutter-go/lib/widgets/elements";
const defaultPath = "/Users/ryan/work/ali/github/flutter-project/flutter-go-web/examples/@ali-flutter-go/lib/widgets/themes";

void main() async{
  qus_ans();
}

void qus_ans() async{
  List<Question> questions = [
    ConfirmQuestion('confirm', '使用输入的文件目录 ?',preferN: false),
    InputQuestion('path', '输入文件目录:', skipIf: (Map ctx) => ctx["confirm"] == false),
    ConfirmQuestion('default', '使用默认文件目录 ?', skipIf: (Map ctx) => ctx["confirm"] == true)
  ];
  Prompt prompt = Prompt(questions);
  Map answers = await prompt.execute();
  String filePath = answers["path"];

  print(Seperator('='));
  /// print(answers);

  if (answers["path"] is String && (answers["path"] as String).isNotEmpty){
    print("使用输入文件目录:${filePath}");
    printFilesAync(filePath);
  }else if(!answers["confirm"] && answers["default"]){
    print("使用默认文件目录:${defaultPath}");
    printFilesAync(defaultPath);
  }else{
    print(format("{@red}放弃转换!{@normal}"));
  }
}

void printFilesAync(String path) async{
  try{
    var  directory  =   new Directory(path);
    List<FileSystemEntity> files = directory.listSync();
    if(files.length == 0) {
      print(format("{@yellow}目录为空！{@normal}"));
      return;
    }
    //print('2::${files}');
    for(var f in files){
      var bool = FileSystemEntity.isFileSync(f.path);
      if(!bool){
        //print('1::${bool}::${f.path}::${files.length}');
        await printFilesAync(f.path);
      }else if(f.path.indexOf('.dart')!=-1){
        print('2::${bool}::${f.path}::${files.length}');
        var newPath = (f.path).replaceAll(new RegExp(r'.dart'), '-copy.dart');
        File newfile = new File(newPath);
        File oldfile = new File(f.path);

        List<String> lines = oldfile.readAsLinesSync();

        var result = '';
        lines.forEach((l)=>{
          if(l.trim().indexOf('package:flutter/material.dart') >=0){
              result += "import 'package:flutter_web/material.dart';\n"
          }else if(l.trim().indexOf('package:flutter/widgets.dart') >=0){
              result += "import 'package:flutter_web/widgets.dart';\n"
          }else if(l.trim().indexOf('package:flutter/cupertino.dart') >=0){
              result += "import 'package:flutter_web/cupertino.dart';\n"
          }else if(l.trim().indexOf('package:flutter/services.dart') >=0){
              result += "import 'package:flutter_web/services.dart';\n"
          }else if(l.trim().indexOf('package:flutter/rendering.dart') >=0){
              result += "import 'package:flutter_web/rendering.dart';\n"
          }else if(l.trim().indexOf('dart:ui') >=0){
              result += "import 'package:flutter_web_ui/ui.dart';\n"
          }else {
              result += '${l}\n'
          }
        }
        );
        oldfile.writeAsStringSync(result);
        //newfile.writeAsStringSync(result);
        ///await newfile.create();
        //await newfile.create();
        ///file.createSync();
        ///await oldfile.delete();
      }
    }
  }catch(e){
    print(format("{@red}目录不存在！{@normal}"));
  }
}