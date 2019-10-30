# 如何为一个项目提PR


## PR 的含义

PR的全称是 **pull request**, 可以理解成. 让开源项目拉取合并他方的请求.


## pull request

1. 将 开源flutter go项目 fork到我们自己的仓库.

![如何fock项目](https://img.alicdn.com/tfs/TB1XbnDbQH0gK0jSZPiXXavapXa-1425-672.gif)

2. 将Fork的仓库 clone 到本地,进行本地修改.

3. 将改动push到自己的仓库中


```
git add {some change file}
git commit ...
git push origin {your branch}

```


4. 登陆github, 从**自己的仓库**向**开源项目仓库** 发起 **pull request** (合并申请);

过程参考:

![如何提pr](https://img.alicdn.com/tfs/TB1zV_BbKL2gK0jSZPhXXahvXXa-1425-672.gif)


5. 开源项目维护者会review您的 **pull request**，展开讨论或者修改, 一旦通过审核，开源项目维护者合并该分支到正式仓库然后并关闭合并申请。