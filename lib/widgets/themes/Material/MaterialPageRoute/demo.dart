import 'package:flutter/material.dart';

class User {
  final String account, email;

  const User({
    this.account,
    this.email,
  });
}

class FirstPage extends StatefulWidget {
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var _usernameController =  TextEditingController();
  var _emailController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          child:  Text(
            "账号登录",
            textAlign: TextAlign.center,
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'account'),
          controller: _usernameController,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "email"),
          controller: _emailController,
        ),
         RaisedButton(
          child: Text("点击跳转"),
          onPressed: () {
            var route =  MaterialPageRoute(
              builder: (BuildContext context) =>  SecondPage(
                  value: User(
                      account: _usernameController.text,
                      email: _emailController.text)),
            );
            Navigator.of(context).push(route);
          },
        )
      ],
    );
  }
}

class SecondPage extends StatefulWidget {
  final User value;

  SecondPage({Key key, this.value}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text("MaterialPageRoute2"),
      ),
      body:  Container(
        child:  Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child:  Text("登陆成功！！！",
                      style: TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold))),
              Padding(
                child:  Text(
                  'account:${widget.value.account}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
              ),
              Padding(
                child:  Text(
                  'email:${widget.value.email}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
