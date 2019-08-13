# GoCli 说明

## 安装

获取最新flutterGo代码分之后. 在项目下会有 **go-cli** 的文件夹.

首先进入该文件夹并安装go-cli所需要的依赖

```
cd go-cli
pub get
```

然后使用pub global命令将文件包注册到全局

```
pub global activate --source  path  /{your project absolute path}/flutter-go/go-cli

```

使用pub global list命令查看全局包列表 如果看到有 **goCli 1.0.0**则证明安装成功

```
goCli 1.0.0 at path "/{youpath}/flutter-go/go-cli"

```






## 固定命令

### goCli createPage

初始化并创建一个Widget详情页, 通常来说. 当我们需要在Widget Tab下. 新加入一个界面内容, 执行该条命令, 会根据您的输入, 自动在本项目中创建对应的文件夹, 并记录相关配置信息, 在创建的目录中, 您可以通过编写markdown代码, 进行文章内容的编写.

### goCli createDemo

初始化并创建一个可实例化的Widget Demo(实例块), 按照在命令行中的提示, 输入我们的相关信息, 我们会创建一个 关于demo 的文件夹. 并会得到一个唯一的 **ID**. 我们可以通过这条ID,在我们的markdown代码中, 进行直接调用. 

例如:

```
[demo: 1a29aa8e_32ae_4241_9c8a_5c9e1f92b096]
```

### goCli build

将本地的界面与实例资源进行打包开成统一的独立的入口. 在拉取flutter-go的项目代码后. 需要执行当前命令. 否则会报错.


### goCli watch

动态便宜Widget Page, 动态进行markdown => dart 代码的转换. 通常在我们编辑Widget page的index.md的时候进行文件监听. 动态生成, 进行本地热更新.



## 注意

- 在修改**page\_demo\_package**或者standard\_pages目录下的文件操作时. 请先执行 **goCLi watch**
- **name**, **author** 字段必须使用英文开头, 不允许使用特殊符号. 正常的示范 name ='name_test' author = 'abcdefg';
- 以下文件目录, 显示**不可人为修改的文件**, 凡是被**合进master主分支的代码**不允许进行任何修改.

```
// demo 文件结构
demoName_yourName_1a29aa8e_32ae_4241_9c8a_5c9e1f92b096/
├── .demo.json (不可人为修改)
├── index.dart (不可人为修改)
└── src
    └── index.dart (可修改)


// widget page 文件结构

standard_pages/
├── index.dart (不可人为修改)
└── standard_sanfan_ee4feb8e_32ae_4241_9c8a_5c9e1f92b096
    ├── .page.json (不可人为修改)
    ├── index.dart (不可人为修改)
    └── index.md (可修改)
```

