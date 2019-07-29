# Flutter Go PR 规范说明

# 贡献指南

此项目遵循[贡献者行为准则](https://github.com/spring-projects/spring-framework/blob/master/CODE_OF_CONDUCT.adoc)。参与此项目即表示您同意遵守其条款.


您的 Pull Request 可能包含以下几种

- 本项目逻辑代码的问题修复或者优化
- widget 示例的完善
- widget 文档的完善与更新


# 文档与DEMO的完善
一个widget的demo实例与文档说明, 由以下目录构成, 我们以**/lib/widgets/components/Tab/Tab**组件举例, 在此文件目录下构建您的demo运行即可看到效果

- index.dart
- demo.dart



# 撰写 Pull Request

为了更好的将 *flutter* 的各种使用方法分享给大家, 我们欢迎第三方提交个人Pull Request(简称为PR)到开源仓库中. 提交的PR需要满足以下规则:

- PR 的提交名称, 请使用有意义可以理解的词汇, 否则我们请直接关闭它.
	- 例如: 增加了XX功能, 优化..., 修复在 XX 状态下对 XX 的异常处理
- PR 只能被提交合并到 *develop* 分支, 被提交到master的 PR, 我们将会直接关闭.
- PR 的描述区,需要描述本次改动的主要内容, 以及为什么要如此改动.
- 避免超大的 PR 提交
	- 当 PR 的改动 **change** 超过1000行(暂定为1000)时, 请尽量拆分后进行提交.
- 规范化的commit信息
	- commit规范参照[develop规范](https://github.com/alibbaba/flutter-go/blob/master/develop.md#commit-%E6%8F%90%E4%BA%A4%E8%A7%84%E8%8C%83)
	- commit列表, 请在提交PR之前做好整理, 避免出现一个功能点的多条commit.[如何整理commit](https://help.github.com/en/articles/using-git-rebase-on-the-command-line)

# 如何提交PR
* fork项目到自己仓库
* git clone （您的仓库地址）到本地
* 建立上游源
    * git remote add upStream git@github.com:alibaba/flutter-go.git
    * 创建开发分支（非必须）
    * git checkout -b develop
* 修改提交代码
    * git status
    * git add .
    * git commit -m 'feat: message'
    * git push origin develop
* 同步代码
    * git fetch upstream
    * git merge upstream/develop
    * git push origin develop
* 提交PR
    * 到自己github仓库对应fork的项目下new pull request

