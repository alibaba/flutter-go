import 'dart:async';
import 'dart:io';
import 'package:args/args.dart';
import 'package:args/command_runner.dart';
//import './version.dart';
import './command/create_demo.dart';
import './command/create_page.dart';
import './command/watch_md.dart';
import './command/build.dart';



Future<int> run(List<String> args) => _CommandRunner().run(args);

class _CommandRunner extends CommandRunner<int> {
  _CommandRunner() : super('goCli', 'A tool to develop flutter go projects.') {
    argParser.addFlag('version',
        negatable: false, help: 'Prints the version of goCi.');
    addCommand(CreateDemoCommand());
    addCommand(CreatePageCommand());
    addCommand(WatchCommand());
    addCommand(Build());
  }

  @override
  Future<int> runCommand(ArgResults topLevelResults) async {
    bool isProject = await Directory('./go-cli').exists();
    // 防止用户在gocli下运行

    if (!isProject) {
      print("请在fluttergo项目根目录中运行,而不是go-cli目录中");
      return 0;
    }

    if (topLevelResults['version'] as bool) {
      return 0;
    }

    // In the case of `help`, `null` is returned. Treat that as success.
    return await super.runCommand(topLevelResults) ?? 0;
  }
}