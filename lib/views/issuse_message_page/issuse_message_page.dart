/// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zefyr/zefyr.dart';
import 'package:flutter_go/utils/data_utils.dart';
import 'package:notus/convert.dart';
import 'package:fluttertoast/fluttertoast.dart';



class IssuesMessagePage extends StatefulWidget {
  @override
  _IssuesMessagePageState createState() => _IssuesMessagePageState();
}

class _IssuesMessagePageState extends State<IssuesMessagePage> {
  final TextEditingController _controller = new TextEditingController();
  final ZefyrController _zefyrController = new ZefyrController(NotusDocument());
  final FocusNode _focusNode = new FocusNode();
  String _title = "";
  var _delta;

  @override
  void initState() {
    _controller.addListener(() {
      print("_controller.text:${_controller.text}");
      setState(() {
        _title = _controller.text;
      });
    });

    _zefyrController.document.changes.listen((change) {
      setState(() {
        _delta = _zefyrController.document.toDelta();
      });
    });

    super.initState();
  }

  void dispose() {
    _controller.dispose();
    _zefyrController.dispose();
    super.dispose();
  }

  _submit() {
    if (_title.trim().isEmpty) {
      _show('标题不能为空');
    } else {
      String mk = (_delta==null)?'No description provided.':notusMarkdown.encode(_delta);
      DataUtils.feedback({'title': _title, "body": mk},context).then((result) {
        _show('提交成功');
        Navigator.maybePop(context);
      });
    }
  }

  _show(String msgs){
    Fluttertoast.showToast(
        msg: msgs,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget buildLoading() {
      return Opacity(
        opacity: .5,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.black,
          ),
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('反馈/意见'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                _submit();
              },
              icon: Icon(
                Icons.near_me,
                color: Colors.white,
                size: 12,
              ),
              label: Text(
                '发送',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          elevation: 1.0,
        ),
        body: ZefyrScaffold(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView(
              children: <Widget>[
                Text('输入标题：'),
                new TextFormField(
                  maxLength: 50,
                  controller: _controller,
                  decoration: new InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                Text('内容：'),
                _descriptionEditor(),
              ],
            ),
          ),
        ));
  }

  Widget _descriptionEditor() {
    final theme = new ZefyrThemeData(
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.grey.shade800,
        toggleColor: Colors.grey.shade900,
        iconColor: Colors.white,
        disabledIconColor: Colors.grey.shade500,
      ),
    );

    return ZefyrTheme(
      data: theme,
      child: ZefyrField(
        height: 400.0,
        decoration: InputDecoration(labelText: 'Description'),
        controller: _zefyrController,
        focusNode: _focusNode,
        autofocus: true,
        physics: ClampingScrollPhysics(),
      ),
    );
  }
}
