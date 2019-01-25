var path = require('path'); //系统路径模块
var fs = require('fs'); //文件模块
var http = require('http');
var child_process = require('child_process');

var file = path.join(__dirname, './log.json'); //文件路径，__dirname为当前运行js文件的目录
    //读取json文件
fs.readFile(file, 'utf-8', function(err, data) {
    if (err) {
        res.send('文件读取失败');
    } else {
       // res.send(data);
       if(data) {
            const obj = JSON.parse(data);
            const newObj ={};
            obj.pr_req.map((item,i)=>{
                const key = encodeURIComponent(item.message);
                newObj[key] ={date: new Date(item.date).toLocaleDateString(),msg:item.message};
            })
            const newObjCategory = Object.values(newObj);
            const categorys ={};
            newObjCategory.map((item)=>{
                if(!categorys[item.date]) {
                    categorys[item.date] =[];
                }else {
                    categorys[item.date].push(item.msg);
                }
            })
            //console.log('----------->',categorys);
            rendHtml(categorys);
       }

    }
});


function rendHtml(categorys){
    http.createServer(function (req, res) {
      var html = buildHtml(categorys);
      res.writeHead(200, {
        'Content-Type': 'text/html;charset=utf-8',
        //'Content-Length': html.length,
        'Expires': new Date().toUTCString()
      });

      res.end(html);
    }).listen(8889,"127.0.0.1");

    console.log("Server running at http://127.0.0.1:8889/");
    child_process.exec(`start "http://127.0.0.1:8080"`);

    function buildHtml(obj) {
      var header = '';
      var body = '';
      var content = '';
      for(var i in obj) {
        let liContent = `<ul style="list-style-type:none">####&nbsp${i}`;
        const list = obj[i];
        list.map((it,index)=>{
            liContent += `<li>&nbsp&nbsp-&nbsp[x]&nbsp${it}</li>`
        })
        liContent += `</ul>`;

        content += liContent;
      }
      // console.log('content===>',content)
      return '<!DOCTYPE html>'
           + '<html><header>' + header + '</header><body>' + content + '</body></html>';
    };
}