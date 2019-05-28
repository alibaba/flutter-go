var fs = require('fs');
var program = require('commander');
var inquirer = require('inquirer');

program
    .command( 'list' ) //声明hi下有一个命令叫list
    .description( 'list files in current working directory' ) //给出list这个命令的描述
    .option( '-a, --all', 'Whether to display hidden files' ) //设置list这个命令的参数
    .action( function ( options ) { //list命令的实现体
        inquirer
            .prompt([
                {
                    type: 'list',
                    name: 'theme',
                    message: 'What do you want to do?',
                    choices: [
                      'Order a pizza',
                      'Make a reservation',
                      new inquirer.Separator(),
                      'Ask for opening hours',
                      {
                        name: 'Contact support',
                        disabled: 'Unavailable at this time'
                      },
                      'Talk to the receptionist'
                    ]
                  },
                  {
                    type: 'list',
                    name: 'size',
                    message: 'What size do you need?',
                    choices: ['Jumbo', 'Large', 'Standard', 'Medium', 'Small', 'Micro'],
                    filter: function(val) {
                      return val.toLowerCase();
                    }
                  }
                /* Pass your questions in here */
            ])
            .then(answers => {
                // Use user feedback for... whatever!!
        });
        // var fs = require( 'fs' );
        // //获取当前运行目录下的文件信息
        // console.log("list>>>>", options.all);
        // console.log("process.cwd()>>", process.cwd());
        // fs.readdir( process.cwd(), function ( err, files ) {
        //     console.log('files>>>', files);
        //     var list = files;
        //     if ( !options.all ) { //检查用户是否给了--all或者-a的参数，如果没有，则过滤掉那些以.开头的文件
        //         list = files.filter( function ( file ) {
        //             return file.indexOf( '.' ) !== 0;
        //         } );
        //     }
        //     console.log( list.join( '\n\r' ) ); //控制台将所有文件名打印出来
        // } );
    } );