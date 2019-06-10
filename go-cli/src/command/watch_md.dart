//
// Created with Android Studio.
// User: 三帆
// Date: 08/06/2019
// Time: 16:34
// email: sanfan.hx@alibaba-inc.com
// target: 监听demo与md
//

import 'package:path/path.dart' as p;
import 'package:args/command_runner.dart';
import '../build/build_demo_list.dart';
import '../build/build_page_list.dart';

import 'package:watcher/watcher.dart';
import '../config.dart';
import 'dart:async';

void watch() {
  Timer _changeTimer;
  List<Map<String, String>> config = [
    {
      "type": "demo",
      "path": '$TARGET_DEMO_DIC'
    }
  ];
  List<String> demoIgnore = [
    '.demo.json',
    'index.dart',
    'info.json',
    'readme.md',
  ];
  var watcherDemo = DirectoryWatcher(p.absolute('$TARGET_DEMO_DIC'));
  watcherDemo.events.listen((event) {

    if (isIgnore(demoIgnore, TARGET_DEMO_DIC, event.path)) {
      return ;
    }
    if (event.type == ChangeType.ADD || event.type == ChangeType.REMOVE) {
      if (_changeTimer != null && _changeTimer.isActive) {
        _changeTimer.cancel();
      }
      _changeTimer = new Timer(Duration(milliseconds: 1000), () {
        buildDemoListJson();
      });
    }

  }, onError: (error) {
    print('watch 发生错误: $error');
  });

  List<String> pageIgnore = [
    'index.dart',
    '.pages.json'
  ];
  var watcherPage = DirectoryWatcher(p.absolute('$TARGET_PAGE_DIC'));
  watcherPage.events.listen((event) {
    if (isIgnore(pageIgnore, TARGET_PAGE_DIC, event.path)) {
      return ;
    }

    if (event.type == ChangeType.ADD || event.type == ChangeType.REMOVE) {
      print("buildPageListJson:::");
      buildPageListJson();
      return ;
    }

    if (event.type == ChangeType.MODIFY) {
      if (event.path.contains('index.md')) {
        transformMd2Dart(event.path.replaceAll('/index.md', ''));
      }
      return ;
    }

    print(event);
  });
}
bool isIgnore (List<String> ignorePath, parentPath, currentPath) {
  for (String ignore in ignorePath) {
    String path = p.absolute(parentPath, ignore);
    if (currentPath.contains(path)) {
//      print("修改的文件, 是忽略列表中的文件, 跳过编译!");
      return true;
    }
  }
  return false;
}
class WatchCommand extends Command<int> {
  @override
  final name = 'watch';
  @override
  final description = '动态生成文档与demo相关';

  CreateDemoCommand() {
  }

  @override
  Future<int> run() async {
    watch();
    return 0;
  }
}