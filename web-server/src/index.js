var program = require( 'commander' );
require('./command');

program
  .version('0.1.0')
program.parse(process.argv); //开始解析用户输入的命令