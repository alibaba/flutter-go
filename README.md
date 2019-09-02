### 欢迎来到 `Flutter GO for web` 的代码库。
##### 此代码库是配合 [Flutter-web](https://github.com/flutter/flutter_web) 官方预览版, 而对 `Flutter Go` 项目做的 `web` 版本的移植。

##### `Flutter的Web`支持尚不稳定。我们将此版本指定为技术预览版; 对 `Flutter Go native` 版本移植还原度大概在 80%左右。旨在帮助 `Flutter` 开发人员，快速熟悉 `Flutter-web` 官方的实践。

##### [在 `Flutter` 官方宣布Flutter暂时不会开发热更新（Code push）](https://github.com/flutter/flutter/issues/14330) 之后, `Flutter-web` 无疑是的动态更新代码最快捷的方式,虽然不是最佳方案,但是是最易用降级方案。

##### 通过 `Flutter-go-web` 版本的学习,可以快速，有效还原 `Flutter-go` native 版本。帮助开发者，对快速版本H5化,做一个样例展示，提供 `Flutter-web` 的能力演示。

### 使用前准备
- [请了解 `Flutter-web` 官方说明](https://github.com/flutter/flutter_web/blob/master/README.md)
- [请了解 `Flutter-web` 的迁移指南](https://github.com/flutter/flutter_web/blob/master/docs/migration_guide.md)

### 如何使用
- git 拉取 `Flutter-go` 项目,并切换到 `web/flutter-go-web-0.0.1` 分支
```dart
  $ git clone -b web/flutter-go-web-0.0.1 https://github.com/alibaba/flutter-go.git flutter-go-web
```

- 安装flutter_web构建工具
```dart
  $ flutter pub global activate webdev
```

- 更新pub包
```dart
  $ pub get

  //... 
  Resolving dependencies... 
Warning: You are using these overridden dependencies:
! flutter_web 0.0.0 from git https://github.com/flutter/flutter_web at 6cabfc in packages/flutter_web
! flutter_web_test 0.0.0 from git https://github.com/flutter/flutter_web at 6cabfc in packages/flutter_web_test
! flutter_web_ui 0.0.0 from git https://github.com/flutter/flutter_web at 6cabfc in packages/flutter_web_ui
Got dependencies!
Precompiling executables... (12.0s)
```

- 开发模式,获取（无状态）热重载 webdev
```dart
  $ webdev serve --auto restart

  [INFO] Building new asset graph completed, took 2.0s
  [INFO] Checking for unexpected pre-existing outputs. completed, took 1ms
  [INFO] Serving `web` on http://127.0.0.1:8080
  [INFO] Running build completed, took 49.7s
  [INFO] Caching finalized dependency graph completed, took 421ms
  [INFO] Succeeded after 50.1s with 3309 outputs (9338 actions)
```

- 浏览器打开 http://127.0.0.1:8080

- 发布模式,创建最终编译结果,这将创建一个build目录`index.html`，`main.dart.js`以及使用静态HTTP服务器运行应用程序所需的其余文件。
```dart
  $ webdev build
```

- 线上展示地址
  - [Flutter GO 官网](https://flutter-go.pub)
  - [Flutter Go web 版本](https://flutter-go.pub/flutter_go_web/#FirstPage)

#### 通过上面操作基本就能运行，`flutter-go-web` 的界面

![https://github.com/alibaba/flutter-go/blob/web/flutter-go-web-0.0.1/assets/00_41_04__08_15_2019.jpg](https://github.com/alibaba/flutter-go/blob/web/flutter-go-web-0.0.1/assets/00_41_04__08_15_2019.jpg)

#### 为了对已有 `native` 工程快速生成 `flutter-web` 版本，可以使用 [trans2fw](https://github.com/ryan730/trans2fw) 工具。
[trans2fw 介绍](https://github.com/ryan730/trans2fw) 是笔者开发的一个 自动化 flutter native 项目转化成 flutter-web 项目的工具。

- 首先拷贝 native 版本下的lib 文件夹到当前目录, 并重命名如: lib-cp。

- 安装 `trans2fw` 工具, 并注册程序
```dart
  $ pub global activate trans2fw
  $ pub global run trans2fw
```

- 运行 `trans2fw` 工具,根据提示输入
```dart
$ trans2fw
[✓] 请输入需要转换的文件目录(相对于项目目录): lib-cp
[✓] 是否覆盖原有文件 ?  (y/N) y
{path: lib-cp, cover: true}
使用输入文件目录:lib-cp
被转换的文件::lib-cp/Pagination.dart::32
被转换的文件::lib-cp/homeBanner-copy-copy.dart::32
...
```
