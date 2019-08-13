String getMd() {
  return """
  # 标准的详情页

您可以在这个界面中, 编写大多数的markdown文案, 他会在 **goCli watch** 下同步被编译成 **dart** 文件

您可以通过goCli创建详情页所需要的demo

```
goCLi createDemo
```

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
```""";

}
