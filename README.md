# Flutter Go
Language: [English](https://github.com/alibaba/flutter-go/blob/master/README-en.md) | [中文简体](https://github.com/alibaba/flutter-go/blob/master/README.md)

![https://img.alicdn.com/tfs/TB1OJkeHNYaK1RjSZFnXXa80pXa-229-229.png](https://img.alicdn.com/tfs/TB1OJkeHNYaK1RjSZFnXXa80pXa-229-229.png)

> 一个帮助开发者快速上手的 `APP`

## 最新动态
### 🔥 `Flutter Go 2.0` 即将发布
> Flutter Go 2.0 秉承年初发布的 [The Flutter-Go Roadmap（路线图） for 2019](https://github.com/alibaba/flutter-go#the-flutter-go-roadmap%E8%B7%AF%E7%BA%BF%E5%9B%BE-for-2019) 已经做了新版本的迭代，新版本如下新功能:

<h6>注：✔是本次发布内容</h6>

- [x] [ `Flutter Go` 官方网站 ](https://flutter-go.pub/website/) (官方消息，发布，学习)
- [x] [ `Flutter Go web` 版本](https://github.com/alibaba/flutter-go/tree/web/flutter-go-web-0.0.1) (web 版本学习帮助)
    - [线上预览版 ](https://flutter-go.pub/flutter_go_web/)
    - [项目地址 ](https://github.com/alibaba/flutter-go/tree/web/flutter-go-web-0.0.1)

- [x] [ `Flutter Go Widget` 的 `pull request`  提交规范（第三方共建）](https://github.com/alibaba/flutter-go/blob/master/docs/contribute.md)

- [x] 用户中心 (专属个人的`widget`案例)
	- 用户登录（通过`GitHub`账户）
	- 全网搜索 （全网搜索 `Flutter` 资讯)
	- 收藏个人组件（保存到远端）
	- 反馈建议 （APP 在线 `ISSUES`）
	- 分享链接 （APP分享）
- [x] [ `go-cli` 工具 ](https://github.com/alibaba/flutter-go/blob/master/docs/widget.md)
	-  `Flutter Go` 的 `pull request` 工具
	-  [命令行 生成 `Flutter Go Widget` 标准公共模版](https://github.com/alibaba/flutter-go/blob/beta/docs/widget.md)
	-  `markdown` 模版动态化生成（合并到master分支后）
- [x] ` Flutter Go ` 官方 `APP` 版本自动升级
- [ ] 多端模版同步( pc端，native端同步 )
- [ ] `Flutter Go` store



## 三方共建说明
 
由于 **flutter** 内容更新较快. 我们无法更快的丰富项目的内容. 如果您愿意为国内flutter的发展与学习贡献自己的力量, 请参考我们的 [共建说明](https://github.com/alibaba/flutter-go/blob/master/docs/contribute.md), 我们会将共建者的头像姓名贡献至我们的官网. 



## 版本更新历史
> 按时间顺序,展示重要的提交更新内容。

[地址](https://github.com/alibaba/flutter-go/blob/develop/CHANGE-LOG.md)

## 开发规范
> 由于类似 javascript, java, object-c,等开发者的语言习惯不同而产生歧义，我们依据官方提供的 [dart 语言规范](https://www.dartlang.org) 定制。

[<< Flutter Go 开发规范第一版 >>](https://github.com/alibaba/flutter-go/blob/develop/Flutter_Go%20%E4%BB%A3%E7%A0%81%E5%BC%80%E5%8F%91%E8%A7%84%E8%8C%83.md)

## The Flutter-Go Roadmap（路线图） for 2019 
> 考虑到 Flutter 未来的变化和策略的可变性, roadmap 不排除有一定调整，但总体不会变化太大。

<img src="https://img.alicdn.com/tfs/TB19UahQQzoK1RjSZFlXXai4VXa-1500-1106.png" width="600px">

## 运行方式

- 查看一下版本号是否正确
```dart
  flutter --version
```
- 运行以下命令查看是否需要安装其它依赖项来完成安装
```dart
  flutter doctor
```
- 运行启动您的应用
```dart
  flutter packages get 
  flutter run
```

- 如果有其他问题,请参考
  - https://flutterchina.club/setup-macos/
  - https://flutter.dev/docs/get-started/install/macos

## Release安装包下载地址

### android正式版，下载地址:

- 华为市场已上线，华为应用市场搜索 "Fluttergo"或者直接[点击下载](https://appstore.huawei.com/search/fluttergo)
- [直接 apk 文件下载](https://github.com/alibaba/flutter-go/blob/master/android/app/release/app-release.apk)


### iphone正式版，下载地址: 

- AppStore 搜索 "Fluttergo" 或者直接[点击下载](https://itunes.apple.com/cn/app/flutter-go/id1462026296?mt=8)
<img src="https://img.alicdn.com/tfs/TB1PygPaBWD3KVjSZFsXXcqkpXa-380-376.jpg" width=200> 


## 基础环境
本项目环境持续更新. 请定期更新各依赖包.

```dart
// 运行如下命令
flutter --version
dart --version
pub --version

// 正确环境如下
// Flutter (Channel beta, v1.7.8)
// Dart VM version: 2.4.0
// Pub 2.4.0
```


### 背景

#### Flutter 是什么?

2018年6月21日Google发布Flutter首个release预览版,作为Google 大力推出的一种全新的响应式，跨平台，高性能的移动开发框架。Flutter是一个跨平台的移动UI框架，旨在帮助开发者使用一套代码开发高性能、高保真的Android和iOS应用。

flutter优点主要包括：
- 跨平台
- 开源
- Hot Reload、响应式框架、及其丰富的控件以及开发工具
- 灵活的界面设计以及控件组合
- 借助可以移植的GPU加速的渲染引擎以及高性能ARM代码运行时已达到高质量的用户体验

#### Flutter Go 的由来

- Flutter学习资料太少，对于英文不好的同学相对来说比较困难
- 官网文档示例不够健全，不够直观
- 各个 widget 的用法各异，属性纷繁，要运行一个 widget 的 demo 往往要到处翻阅各种资料

#### Flutter Go 的优势

- 详解常用 widget 多达 **140+** 个
- 配套 Demo 详解 widget 常规用法
- 集中整合 widget 案例，一个 APP 搞定所有常用 widget 的用法
- 持续迭代 ‘追新’ 官方版本

### app 预览


<img src="https://img.alicdn.com/tfs/TB1MoiNExTpK1RjSZFGXXcHqFXa-362-751.gif" width=200> <img src="https://img.alicdn.com/tfs/TB1oeicBhjaK1RjSZFAXXbdLFXa-345-717.gif" width=200>  <img src="https://img.alicdn.com/tfs/TB1WJNuBmzqK1RjSZPcXXbTepXa-345-717.gif" width=200>  <img src="https://img.alicdn.com/tfs/TB13Xh3BkvoK1RjSZFNXXcxMVXa-345-717.gif" width=200>  

### Core Team

<table>
  <tbody>
    <tr>
      <td align="center" width="80" valign="top">
        <img height="80" width="80" src="https://github.com/minghe.png?s=128">
        <br>
        <a href="https://github.com/minghe">@minghe</a>
      </td>
      <td align="center" width="80" valign="top">
        <img height="80" width="80"  src="https://github.com/ryan730.png?s=128">
        <br>
        <a href="https://github.com/ryan730">@ryan730</a>
      </td>
      <td align="center" width="80" valign="top">
        <img height="80" width="80"  src="https://github.com/Nealyang.png?s=128">
        <br>
        <a href="https://github.com/Nealyang">@Nealyang</a>
      </td>
      <td align="center" width="80" valign="top">
        <img height="80" width="80"  src="https://github.com/hanxu317317.png?s=128">
        <br>
        <a href="https://github.com/hanxu317317">@hanxu317317</a>
      </td>
      <td align="center" width="80" valign="top">
        <img height="80" width="80"  src="https://github.com/DeckeDeng.png?s=128">
        <br>
        <a href="https://github.com/DeckeDeng">@DeckeDeng</a>
      </td>
     </tr>
  </tbody>
</table>

### 版权说明
- 感谢大家对 `flutter go` 的支持和下载,但近期发现，有类似直接被发布到苹果 app store 上的行为，并未注明真实来源，copyright 和 项目的 github 地址，以及开发者的版权相关信息（ 包括删除"首页栏的版权声明"和"关于我们"的行为 );

- 上述行为，打击了 `flutter go` 开发者的积极性，同时干扰了 flutter go app 的正常发布渠道，基于 app 开源项目的发布特殊性，特更新 [LICENSE](LICENSE) 「 开源许可证 」,由 MIT 协议 更改为 BSD 协议, 同时建议不要随意发布到公共渠道的应用商店，影响官方 `flutter go` 的app版本迭代;

- 大家可以继续放心的开源使用,但是要求注意和遵守以下许可前提:
```
    * 版权声明样式
    //Copyright (c) 2018-present, Alibaba Group Holding Limited. All rights reserved.
    
    * 源代码的重新分发必须保留上述版权声明，条件清单和免责声明。
    
    * 二进制形式的再分发必须复制上述版权声明，此条件列表以及文档中的以下免责声明和/或随分发提供的其他材料。
```
- 由于本开源项目是供大家学习和交流 flutter 之用，里面耗费了开发人员大量的心血，精力和热情，请尊重开发者的劳动成果,以及相关许可证之规定;

- 大家的互相信任，尊重与支持，才是开源社区前进的动力和来源.

Powered by 阿里拍卖前端团队<img src="https://img.alicdn.com/tfs/TB1foEhAMHqK1RjSZJnXXbNLpXa-166-166.png" width=20 height=20>

