/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/6/9
 * Time: 9:01 AM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'dart:io'; // io作为dart标准库，用来操作文件，不需要在pubspec.yaml中声明依赖
import 'package:args/args.dart';

ArgResults argResults;

void main(List<String> arguments) {
  final ArgParser argParser = new ArgParser()
    ..addOption('title', abbr: 't',
        help: "The title will be inserted into the <title> tag.")
    ..addOption('filename', abbr: 'f', defaultsTo: 'index.html',
        help: "Optional. Output file name. (Default: index.html)");

  argResults = argParser.parse(arguments);

  final String title = argResults['title'];

  if (title == null) {
    handleError("Missing required argument: title");
  }
  else {
    final String filename = argResults['filename'];
    final String output = """<!DOCTYPE html>
        <html>
        <head>
          <meta charset="UTF-8">
          <title>$title</title>
        </head>
        <body>
        
        </body>
        </html>
    """;

    new File(filename).writeAsStringSync(output);// 为了简单实用了同步版本
    stdout.writeln("File saved: $filename");
  }
}

// 异步输出错误信息到标准错误流
void handleError(String msg) {
  stderr.writeln(msg);
  exitCode = 2; //当程序退出，虚拟机检查exitCode，0 表示Success，1 表示Warnings,2 表示Errors
}