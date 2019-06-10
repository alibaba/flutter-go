import 'dart:async';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import './version.dart';
import './command/create_demo.dart';
import './command/create_page.dart';
import './command/watch_md.dart';



Future<int> run(List<String> args) => _CommandRunner().run(args);

class _CommandRunner extends CommandRunner<int> {
  _CommandRunner() : super('goCli', 'A tool to develop flutter go projects.') {
    argParser.addFlag('version',
        negatable: false, help: 'Prints the version of goCi.');
    addCommand(CreateDemoCommand());
    addCommand(CreatePageCommand());
    addCommand(WatchCommand());

  }

  @override
  Future<int> runCommand(ArgResults topLevelResults) async {
    if (topLevelResults['version'] as bool) {
      return 0;
    }

    // In the case of `help`, `null` is returned. Treat that as success.
    return await super.runCommand(topLevelResults) ?? 0;
  }
}