import 'dart:io';
import 'package:args/args.dart'; // 使用其中两个类ArgParser和ArgResults
import 'package:dart_inquirer/dart_inquirer.dart';
import 'package:console/console.dart';
import 'package:path/path.dart' as p;
import 'package:args/command_runner.dart';
import '../build/build_demo_list.dart';

import '../config.dart';
import '../../utils/util.dart';



ArgResults argResults; // 声明ArgResults类型的顶级变量，保存解析的参数结果

class DemoDetail {
  String name;
  String author;
  String email;
  String desc;
  String id;
  DemoDetail.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'].trim();
    author = json['author'].trim();
    email = json['email'].trim();
    desc = json['desc'].trim();
    id = json['id'] ?? generateId();


  }
}
// 同时，argResults也是ArgResults的实例
void createDemo() async {
  Map environmentVars = Platform.environment;
  List<Question> questions = [
    InputQuestion('name', '请输入新增加的demo名称?'),
    InputQuestion('author', '请输入您的姓名(使用英文)'),
    InputQuestion('email', '请输入您的github的email地址'),
    InputQuestion('desc', '请输入您demo的描述'),
  ];

  Map<dynamic, dynamic> answers = {};
  // 获取初次信息
  Prompt prompt = Prompt(questions);
  DemoDetail demoDetail;
  answers = await prompt.execute();

  print(Seperator());
  print('您新增的组件信息如下');
  print(Seperator('='));
  prettyPrintJson(answers);
  print(Seperator('='));

  questions =[ConfirmQuestion('confirm', 'Is this the config you want ?')];
  prompt = Prompt(questions);
  Map confirmAnswers = await prompt.execute();
  if (confirmAnswers['confirm'] != true) {
    return createDemo();
  }
  demoDetail = DemoDetail.fromJson(answers);

  var demoPath = '$TARGET_DEMO_DIC/${demoDetail.name}_${demoDetail.author}_${demoDetail.id}';

  // 创建root文件
  await createFile(demoPath);
  await createFile('$demoPath/src');
//  print("demoPath>>>> ${environmentVars['PWD']}/${demoPath}");
  writeContent2Path('$demoPath/src/', 'index.dart', """
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("this is flutter go init demo"),
    );
  }
}
  """);

  writeContent2Path('$demoPath/', '.demo.json', """
{
  "name": "${demoDetail.name}",
  "screenShot": "",
  "author":"${demoDetail.author}",
  "email": "${demoDetail.email}",
  "desc": "${demoDetail.desc}",
  "id": "${demoDetail.id}"
}
  """);

  writeContent2Path('$demoPath/', 'index.dart', """
//
// Created with flutter go cli
// User: ${demoDetail.author}
// Time: ${new DateTime.now()}
// email: ${demoDetail.email}
// desc:  ${demoDetail.desc}
//

import 'src/index.dart';

var demoWidgets = [
  new Demo()
];

  """);
//  format('{color.red}Invalid demo happends:  $details {color.normal}');
  prettyPrintJson({
    '新建的demo文件位于': p.absolute((demoPath)),
    'demoId为': demoDetail.id,
    'markdown中调用方式': '[demo:${demoDetail.id}]'
  });
  buildDemoListJson();
}


class CreateDemoCommand extends Command<int> {
  @override
  final name = 'createDemo';
  @override
  final description = '新增flutter go demo.';

  CreateDemoCommand() {
  }

  @override
  Future<int> run() async {
    createDemo();
    return 0;
  }
}