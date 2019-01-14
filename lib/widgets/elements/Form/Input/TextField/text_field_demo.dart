import 'package:flutter/material.dart';

/*
* 基本示例
* 
*/
class DefaultTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //文本是起始端对齐
        children: <Widget>[
          Text('下面是基本输入框：',
              style: TextStyle(fontSize: 15.5, height: 1.2, color: Colors.blue),
              textAlign: TextAlign.left),
          TextField()
        ],
      ),
    );
  }
}

/*
* 稍微复杂些的 TextField
* */
class CustomTextField extends StatelessWidget {
  void _textFieldChanged(String str) {
    print(str);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.all(30.0),
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            icon: Icon(Icons.text_fields),
            labelText: '请输入你的姓名)',
            helperText: '请输入你的真实姓名',
          ),
          onChanged: _textFieldChanged,
          autofocus: false,
        ));
  }
}
