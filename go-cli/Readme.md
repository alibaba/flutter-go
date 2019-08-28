# GoCli 使用方式

## 安装

获取最新flutterGo代码分之后. 在源文件下会有 **go-cli** 的文件.

首先进入该文件夹并安装go-cli所需要的依赖

```
cd go-cli
pub get
```

然后使用pub global命令将文件包注册到全局

```
pub global activate --source  path  /{your flutter go absolute path}/fluttergo/go-cli

```

使用pub global list命令查看全局包列表 如果看到有 **goCli 1.0.0**则证明安装成功

```
goCli 1.0.0 at path "/{youpath}/flutter-go/go-cli"

```



## 使用方式

现在支持以下几种命令

- createDemo   新增flutter go demo.
- createPage   新增flutter go page.
- watch        动态生成文档与demo相关
- build        生成文档与demo相关

### createDemo

动态生成widget demo, 可以创建demo.以便详情页中使用


在flutter go 根文件下通过命令行输入以上命令可以进行以下操作

[✓] 请输入新增加的demo名称? demoName

[✓] 请输入您的姓名(使用英文) yourName

[✓] 请输入您的github的email地址 yourEmail

[✓] 请输入您demo的描述 这是一个测试的标准demo


在完成以上操作后, 可以得到这样的输出:


```
------------------
您新增的组件信息如下
==================
{
	  name : demoName
	  author : yourName
	  email : yourEmail
	  desc : 这是一个测试的标准demo
}
==================
[✓] Is this the config you want ?  (Y/n) y
{
    新建的demo文件位于 : /flutter go/lib/page_demo_package/demoName_yourName_1a29aa8e_32ae_4241_9c8a_5c9e1f92b096
    demoId为 : 1a29aa8e_32ae_4241_9c8a_5c9e1f92b096
    markdown中调用方式 : [demo:1a29aa8e_32ae_4241_9c8a_5c9e1f92b096]
}

```
您可以在任意详情页中, 通过以下方式调用

```
[demo: 1a29aa8e_32ae_4241_9c8a_5c9e1f92b096]
```



### createPage

使用方式同上. 通过该命令可以创建标准的详情页.您可以通过修改index.md进行动态的更新您所创建的详情页.

目录结构为

```
standard_pages/
├── index.dart (不可人为修改)
└── standard_sanfan_ee4feb8e_32ae_4241_9c8a_5c9e1f92b096
    ├── .page.json (不可人为修改)
    ├── index.dart (不可人为修改)
    └── index.md (可修改)
```

### watch

监听并编译standard_pages与page_demo_package下的的文件改动. 动态处理demo目录与文件markdown转化等.

## 注意

- 在修改page_demo_package或者standard_pages目录下的文件操作时. 建议在flutterGo目录执行goCLi watch 开启文件动态编译
- name, author 字段必须使用英文开头, 不允许使用特殊符号. 正常的示范 name ='name_test' author = 'abcdefg';
- 暂时阶段demo与page,一经过创建不允许修改名称作者等信息. 凡是被收录进主分支的不允许被删除


