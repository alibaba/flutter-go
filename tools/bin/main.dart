/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/6/9
 * Time: 8:16 AM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'package:args/args.dart'; // 使用其中两个类ArgParser和ArgResults

ArgResults argResults; // 声明ArgResults类型的全局变量，保存解析的参数结果
// 同时，argResults也是ArgResults的实例

void main(List<String> arguments) {
  // 创建ArgParser的实例，同时指定需要输入的参数
  final ArgParser argParser = new ArgParser()
    /// “help”参数通过addFlag()定义；flag 是一个特殊的命令行参数，它是一个Boolean值而不是String。如果flag在命令行中出现，它的值是true。
    ..addOption('name', abbr: 'n', defaultsTo: 'World', help: "Who would you like to greet?") // abbr表示缩写或别名，defaultsTo表示默认值
    ..addFlag('help', abbr: 'h', negatable: false, help: "Displays this help information.");

  argResults = argParser.parse(arguments);
  if (argResults['help']) {
    print("""** HELP **${argParser.usage}""");
  }

  // usage显示所有help内容

  final String name = argResults['name'];

  print("Hello, $name!");
}