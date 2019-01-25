
#!/bin/bash

# pr 日志生成器，自动 pr 工具抓取器，抓取两周前至今的,提交数据，并去重。
# 生成一个 http 页面，打印成 markdown 格式
# run $ bash tools/getPR.sh

# git log --pretty="%h - %s - %ad" --author=ryan --since=2.weeks --no-merges > tools/log.txt

logs=`git log --date=iso --since=2.weeks --no-merges --pretty=format:'{"commit": "-%h","author": "%aN <%aE>","date": "%ad","message": "%s"},'`

log1=${logs}

# echo ${log1%*,}

echo '{"pr_req":['${log1%*,}']}' > tools/log.json

node ./tools/parsLog.js