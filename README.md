Language: [English](https://github.com/alibaba/flutter-go/blob/master/README-en.md) | [中文简体](https://github.com/alibaba/flutter-go/blob/master/README.md)
## Flutter Go

![https://img.alicdn.com/tfs/TB1OJkeHNYaK1RjSZFnXXa80pXa-229-229.png](https://img.alicdn.com/tfs/TB1OJkeHNYaK1RjSZFnXXa80pXa-229-229.png)

> 帮助开发者快速上手 Flutter  **Flutter Go 1.0 Android版已正式发布**

## 共建说明

由于 **Flutter 版本迭代速度较快**,迭代产生的内容较多, 而我们**人力有限**无法更加全面快速的支持Flutter Go的日常维护迭代, 无论您是上学的学生, 还是已经进入社会工作, 如果您对flutter go的共建感兴趣, 欢迎您来参与本项目的共建. [共建说明](https://github.com/alibaba/flutter-go/blob/master/docs/contribute.md)

**凡是参与共建的成员. 我们会将您的头像与github个人地址收纳进我们的官方网站中.**

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
<img src="https://img.alicdn.com/tfs/TB1LbEYarys3KVjSZFnXXXFzpXa-378-380.jpg" width=200> 

### iphone正式版，下载地址: 

- AppStore 搜索 "Fluttergo" 或者直接[点击下载](https://itunes.apple.com/cn/app/flutter-go/id1462026296?mt=8)
<img src="https://img.alicdn.com/tfs/TB1PygPaBWD3KVjSZFsXXcqkpXa-380-376.jpg" width=200> 


## 基础环境
本项目环境持续更新. 请定期更新各依赖包.

- dart(version: 2.0.0)
- flutter(version: v1.0.0)


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

