# flutter-common-widgets-app

### 使用背景
* 鉴于目前flutter官方庞大的小部件（widget）系统以及api文档，只有文字描述，而没有可视化实例。
* 我们开发这套app,可以系统的看到常用小部件（widget）的用法。
* 辅助初学者更快上手,flutter官方小部件（widget）



### 参考资料

* [flutter-widgets的官方库地址]( https://docs.flutter.kim/widgets/widgets-library.html )
* [flutter-widgets的官方目录集]( http://doc.flutter-dev.cn/widgets/ )
* [sqlitestudio 本地可视化工具] (https://sqlitestudio.pl/index.rvt)

### 分支命名及使用规范

* 分支命名规范
	- 自己开发分支命名统一为 username ，如：yifeng
	- 分支两条主线为 Master分支和develop分支
	- Master作为发布分支，develop作为开发测试分支、自己开发分支从dev checkout出去，发布即 merge to master

* 分支合并规范
	- 从最新的develop分支checkout出自己的开发分支
	- 在自己开发开发分支开发完成后，先去develop分支pull最新代码，
	- 将develop 分支最新代码 merge 到自己分支，确保无冲突
	- 再切回develop分支merge自己开发分支代码，确保无冲突，且能正常运行

### commit 提交规范
* $git cz

* 用于说明 commit 的类别，只允许使用下面7个标识。

  - feat：新功能（feature）

  - fix：修补bug

  - docs：文档（documentation）

  - style： 格式（不影响代码运行的变动）

  - refactor：重构（即不是新增功能，也不是修改bug的代码变动）

  - test：增加测试

  - chore：构建过程或辅助工具的变动


### 代码规范
* 文件命名规范
	- 文件命名使用下划线命名法，如：hello_world
	- 请使用英文进行命名，不允许使用拼音。命名要求具有可读性，尽量避免使用缩写与数字
	- 未完待续

* 代码编码规范
	- 文件编码统一使用 UTF-8 编码；
	- 前端编码采用首字母小写驼峰法. Widget Class 必须采用首字母大写驼峰法.

### 文件目录结构(以LIb文件说明)

- lib
	- main.dart 入口文件
	- common 公共的method
	- components widget
	- generated
	- model 存放模型, 不应该加入逻辑层
	- router 路由
	- views 展示界面
	- widget (与components概念重合,废弃)

``` javascript
├── main.dart //入口文件
├── common 公共的method
│   ├── Style.dart
│   ├── eventBus.dart
│   ├── provider.dart
│   └── sql.dart
├── components //app展示框架用到的组件
│   ├── Input.dart
│   ├── List.dart
│   ├── Pagination.dart
│   ├── Pagination2.dart
│   ├── SearchInput.dart
│   └── homeBanner.dart
├── generated
│   └── i18n.dart
├── model //本地存放模型, 不应该加入逻辑层
│   ├── base.dart
│   ├── cat.dart
│   ├── story.dart
│   └── widget.dart
├── routers //路由
│   ├── application.dart
│   ├── router_handler.dart
│   └── routers.dart
├── views //app展示界面
│   ├── Detail.dart
│   ├── FirstPage.dart
│   ├── FourthPage.dart
│   ├── ThirdPage.dart
│   ├── category.dart
│   ├── demos
│   │   ├── home.dart
│   │   └── layout
│   │       ├── SamplePage.dart
│   │       └── layout_type.dart
│   └── widgetPage.dart
└── widgets
    └── ... //下面详细说明
```

``` javascript
└── widgets // 对flutter所有元素和组件的分类
    ├── 404.dart
    ├── index.dart // widgets 的总入口文件
    ├── components // 组件的分类 (区别于上面的components)
    │   └── index.dart
    ├── elements // 基础元素的分类
    │   ├── index.dart // elements下的 elements 类型入口文件
    │   ├── Form // elements下的 From 类型集合
    │   │   ├── Button // button 元素，里面是 文件夹代表类名/index.dart
    │   │   │   ├── FlatButton
    │   │   │   │   └── index.dart
    │   │   │   ├── RaisedButton
    │   │   │   │   └── index.dart
    │   │   │   └── index.dart
    │   │   ├── CheckBox
    │   │   ├── Input
    │   │   ├── Radio
    │   │   ├── Slider
    │   │   ├── Switch
    │   │   ├── Text
    │   │   └── index.dart
    │   ├── Frame // elements下的 Frame 类型集合
    │   │   ├── Align
    │   │   ├── Axis
    │   │   ├── Box
    │   │   ├── Expanded
    │   │   ├── Layout
    │   │   ├── Stack
    │   │   ├── Table
    │   │   └── spacing
    │   └── Media // elements下的 Media 类型集合
    │       ├── Canvas
    │       ├── Icon
    │       └── Image
    └── themes
        └── index.dart
```

```javascript
widget 里的文件结构，用来存放封装的逻辑组件, 文件目录应为, 类比rax
- widget // widget 下详细元素或组件的目录结构
	- hello-world // 例如
		- mods	  // (可选, 子模块)
		- mocks // (可选)
		- utils // (可选, 存放暂时的私有method)
		- schema
		- index.dart
```