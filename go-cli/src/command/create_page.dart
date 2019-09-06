import 'dart:io';
import 'package:args/args.dart'; // 使用其中两个类ArgParser和ArgResults
import 'package:dart_inquirer/dart_inquirer.dart';
import 'package:args/command_runner.dart';

import '../build/build_page_list.dart';
import '../config.dart';
import '../../utils/util.dart';

var pageMarkdown  = """
# page

this is page markdown

you can load demo like this

```
[demo: xxxid]
```

""";


ArgResults argResults; // 声明ArgResults类型的顶级变量，保存解析的参数结果

class PageDetail {
  String name;
  String author;
  String title;
  String email;
  String desc;
  String id;
  PageDetail.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    author = json['author'];
    title = json['title'];
    email = json['email'];
    desc = json['desc'];
    id = json['id'] ?? generateId();
  }
}
// 同时，argResults也是ArgResults的实例
void createPage() async {
  Map environmentVars = Platform.environment;
  List<Question> questions = [
    InputQuestion('name', '请输入文件名称?'),
    InputQuestion('title', '请输入界面名称?'),
    InputQuestion('author', '请输入您的姓名(使用英文)'),
    InputQuestion('email', '请输入您的email地址'),
    InputQuestion('desc', '请输入您界面的简要'),
  ];

  Map<dynamic, dynamic> answers = {};
  // 获取初次信息
  Prompt prompt = Prompt(questions);
  PageDetail pageDetail;
  answers = await prompt.execute();
  print(Seperator());
  print('您新增的界面信息如下');
  print(Seperator('='));
  prettyPrintJson(answers);
  print(Seperator('='));

  questions =[ConfirmQuestion('confirm', 'Is this the config you want ?')];
  prompt = Prompt(questions);
  Map confirmAnswers = await prompt.execute();
  if (confirmAnswers['confirm'] != true) {
    return createPage();
  }
  pageDetail = PageDetail.fromJson(answers);

  var demoPath = '$TARGET_PAGE_DIC/${pageDetail.name}_${pageDetail.author}_${pageDetail.id}';

  // 创建root文件
  await createFile(demoPath);

  pageMarkdown = await readeFile("${environmentVars['PWD']}/go-cli/utils/tpl.md");

  writeContent2Path('$demoPath/', 'index.dart', """
String getMd() {
  return \"\"\"
  ${pageMarkdown}\"\"\";

}
""");

  writeContent2Path('$demoPath/', '.page.json', """
{
  "name": "${pageDetail.name}",
  "screenShot": "",
  "author":"${pageDetail.author}",
  "title":"${pageDetail.title}",
  "email": "${pageDetail.email}",
  "desc": "${pageDetail.desc}",
  "id": "${pageDetail.id}"
}
  """);

  writeContent2Path('$demoPath/', 'index.md', pageMarkdown);
  buildPageListJson();
  prettyPrintJson({
    '界面位于': demoPath,
    'Id': pageDetail.id,
    '文件夹名称': '${pageDetail.name}_${pageDetail.author}_${pageDetail.id}'
  });
}


class CreatePageCommand extends Command<int> {
  @override
  final name = 'createPage';
  @override
  final description = '新增flutter go page.';

  CreateDemoCommand() {

  }

  @override
  Future<int> run() async {
    createPage();
    return 0;
  }
}