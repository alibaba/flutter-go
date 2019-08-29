# 如何在Widget目录新增界面

> goCli是我们为了引入第三方页面编写的脚本命令. 向Widget新增页面时, 需要安装goCli脚本到全局.



## 安装goCli

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
> 更多关于 **goCli** 请参考  [go-cli(共建工具)](https://github.com/alibaba/flutter-go/blob/beta/docs/go-cli.md) 文档




## 新建 Widget

在Widget列表页, 我们设有一个组, 名叫 **Developer**, 这个分组的作用是用来展示第三方作者提交的内容. 开发状态下正常情况下会显示以下内容

<img src="https://img.alicdn.com/tfs/TB1RCfZc1H2gK0jSZJnXXaT1FXa-798-1582.png" width='300px' />

在项目的根目录下使用 **goCLi createPage** 固定命令, 按照命令行提示信息. 输入新建界面的相关信息, 工具会自动的在 **lib/standard_pages/** 文件夹下创建一个Widget文件夹


```
goCli createPage
```

![](https://img.alicdn.com/tfs/TB1C9qKdoY1gK0jSZFCXXcwqXXa-1314-928.png)

按照以上操作会得到以下信息输出:

```
{
        界面位于 : lib/standard_pages/name_author_06819c62_42ae_4241_9c8a_5c9e1f92b096
        Id : 06819c62_42ae_4241_9c8a_5c9e1f92b096
        文件夹名称 : name_author_06819c62_42ae_4241_9c8a_5c9e1f92b096
}


```

### 字段注意事项

**name** 必须**英文开头**, 统一用小写的英文字母，数字和下划线的组合，不得包含汉字空格和特殊字符, 需要与文章内容相关


**author** 可以为中文英文以及任意组合, 但是不得有歧义, 暴力, 辱骂等词汇, 否则可能会被拒绝合并

**desc** 相关的简要描述, 需要对添加的组件或者界面进行简要描述, 方便后期搜索引擎采集

**email** 创建者的邮箱

## 查看创建的Widvet

为了能正确的加载出新的界面, 建议重新启动当前项目. 在**Widget => Developer => 本地代码**中,您可以找到您新建的界面

<image src='https://img.alicdn.com/tfs/TB1eNLYc7Y2gK0jSZFgXXc5OFXa-744-722.png' width='300px' />

> 注意在android studio中, 有些情况下会无法在 **project** 目录中看到新创建的界面, 通常工程重启后. 会显示出新创建的文件
  
## 编辑界面

为了能动态的将**markdown**转化成**Widget 页面可识别**的内容, 再您更新widget页面的markdown文件之前, 请先执行脚本 **goCli Watch**,  以便在更改Widget页面时, 动态更新我们详情页的内容.



目标详情页

```
lib/standard_pages/standard_for_slider_sanfan_8ab2b5c2_42ae_4241_9c8a_5c9e1f92b096/index.md
```


参考:

![](https://img.alicdn.com/tfs/TB1cHLZc.T1gK0jSZFhXXaAtVXa-1393-760.gif)



## 引用Flutter 实例


如何在页面中引用flutter widget实例请参考: [WidgetDemo](https://github.com/alibaba/flutter-go/blob/master/go-cli/utils/tpl.md)



## 申请合并master

当我们的本地功能调试没有问题. 想要申请合并到主分支时.需要按以下流程进行

1.新建issue, 按照widget page类型模板, 填写需要的相关数据

![](https://img.alicdn.com/tfs/TB1YMkCdUH1gK0jSZSyXXXtlpXa-805-354.png)

2.创建pr, 标题简要描述界面内容. 内容框填写issueID 例如 "#12" 
