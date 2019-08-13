### 使用pub global命令将文件包注册到全局
pub global activate --source path /Users/ryan/work/ali/github/flutter-study/flutter_web/tools

### 使用pub global run命令运行注册的脚本文件
pub global run testCom:main

### 使用pub global list命令查看全局包列表
pub global list

### 运行加参数的的示例
pub global run testCom:main -n go

### 创建html文件
pub global run testCom:creatHtml -t testTile -f test.html

### 可执行程序
- 任何bin目录下的dart脚本可注册为可执行程序，分为两步：

- 在pubspec.yaml中添加executables部分

executables:
  包名: main # 要运行的脚本名称，（注意冒号后面的空格）如果有多个脚本，可以添加多个


### 通过pub global activate 全局注册

pub global activate --source path <包路径>

#### 直接以包名为命令在命令行中输入即可执行。
z
- 执行 main 程序就可以直接运行了
main

