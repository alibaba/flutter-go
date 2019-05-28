var fs = require('fs');
var program = require('commander');
var inquirer = require('inquirer');
var util = require('../util/utils');
program
    .command( 'demo' ) 
    .description( 'init a demo to flutter go' )
    .action( function ( options ) { //list命令的实现体
        inquirer
            .prompt([
                {
                    type: 'input',
                    name: 'name',
                    message: '请输入新增加的demo名称?',
                },
                {
                    type: 'input',
                    name: 'author',
                    message: '请输入您的姓名?',
                },
                {
                    type: 'input',
                    name: 'email',
                    message: '请输入您的email与github相同',
                },
                {
                    type: 'input',
                    name: 'desc',
                    message: '请输入您demo的描述',
                }
            ])
            .then(answers => {
                console.log("answers>>>", answers);
        });
} );
    