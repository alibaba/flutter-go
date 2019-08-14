安装flutter_web构建工具
要安装webdev包为Flutter for web提供构建工具的 包，请运行以下命令：

$ flutter packages pub global activate webdev
确保$HOME/.pub-cache/bin目录 在您的路径中，然后您可以webdev直接从终端使用该命令。

注意：如果您在配置webdev直接运行时遇到问题，请尝试：
flutter packages pub global run webdev [command]。

运行hello_world示例
该示例存在于examples/hello_world存储库中。

$ cd examples / hello_world /
更新包。

$ flutter包升级
！flutter_web 0.0.0 from path ../../flutter_web 
！flutter_web_ui 0.0.0 from path ../../flutter_web_ui 
在hello_world中运行“flutter packages upgrade”... 5.0s
如果成功，你就可以运行了！

在本地构建并提供示例。

$ webdev serve 
[INFO]生成构建脚本完成，耗时331ms 
... 
[INFO]建立新资产图完成，耗时1.4s 
... 
[INFO]运行构建完成，耗时27.9s 
... 
[INFO] 28.1后成功s有618个输出（3233个动作）
在http：// localhost：8080上提供`web`
在Chrome中打开http：// localhost：8080，您应该会Hello World在左上角看到红色文字。

获取（无状态）热重载 webdev
要webdev与热重载一起使用，请在项目目录中运行以下命令：

$ webdev serve --auto restart
您会注意到````的相似输出，flutter packages pub run build_runner serve 但现在更改为您的应用程序代码应该导致在保存时快速刷新应用程序。

注意：该--hot-reload选项并不完美。如果发现意外行为，则可能需要手动刷新页面。

注意：该--hot-reload选项目前是“无状态”。重新加载时应用程序状态将丢失。我们希望在网上提供“有状态”的热重载 - 我们正积极致力于此！

使用生产JavaScript编译器构建
上面介绍的工作流程（可用于build_runner和webdev）使用Dart Dev Compiler，它专为快速，增量编译和简单调试而设计。

如果您想评估生产性能，浏览器兼容性和代码大小，可以启用我们的发布编译器 dart2js。

要启用发布编译器，请传入--release标志（或只是-r）。

$ webdev serve -r
注意：此配置中的构建可能会更慢。

如果您想生成输出到磁盘，我们建议您使用webdev。

$ webdev build
这将创建一个build目录index.html，main.dart.js以及使用静态HTTP服务器运行应用程序所需的其余文件。

要优化输出JavaScript，可以使用build.yaml项目根目录中的文件启用优化标志 ，其中包含以下内容：

＃请参阅https://github.com/dart-lang/build/tree/master/build_web_compilers#configuration 
目标：
   $ default：
     builders：
       build_web_compilers | entrypoint：
         generate_for：
        - web / **。dart 
        选项：
           dart2js_args：
            - --no-source-maps 
            - -O4
注意：该-O4选项启用了许多高级优化，这些优化可能会导致未经过全面测试的代码中的运行时错误。

uglifyjs project/ali-flutter-go/build/main.dart.js -o project/ali-flutter-go/build/main.dart.js