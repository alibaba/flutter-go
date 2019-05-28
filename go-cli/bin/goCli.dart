import 'package:args/args.dart'; // 使用其中两个类ArgParser和ArgResults
import 'package:args/command_runner.dart';
import '../src/cli-command-runder.dart';
ArgResults argResults; // 声明ArgResults类型的顶级变量，保存解析的参数结果

// 同时，argResults也是ArgResults的实例
void main(List<String> args) async {
//  createDemo();
  try {
     await run(args);
  } on UsageException catch (e) {

    print(' ');
    print(e.usage);

  }
}