/*
 * @Author: 一凨 
 * @Date: 2018-12-27 15:17:10 
 * @Last Modified by: 一凨
 * @Last Modified time: 2018-12-27 15:39:35
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  final String _simpleValue1 = 'Menu item value one';
  final String _simpleValue2 = 'Menu item value two';
  final String _simpleValue3 = 'Menu item value three';
  String _simpleValue;

  void showMenuSelection(String value) {
    if (<String>[_simpleValue1, _simpleValue2, _simpleValue3].contains(value))
      _simpleValue = value;
    showInSnackBar('You selected: $value');
  }

    void showInSnackBar(String value) {
    Fluttertoast.instance.showToast(
        msg: value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  @override
  void initState() {
    super.initState();
    _simpleValue = _simpleValue2;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('An item with a context menu button'),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                        value: _simpleValue1,
                        child: const Text('Context menu item one')),
                    const PopupMenuItem<String>(
                        enabled: false, child: Text('A disabled menu item')),
                    PopupMenuItem<String>(
                        value: _simpleValue3,
                        child: const Text('Context menu item three')),
                  ],
            ),
          ),
          ListTile(
            title: const Text('An item with a sectioned menu'),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                        value: 'Preview',
                        child: ListTile(
                            leading: Icon(Icons.visibility),
                            title: Text('Preview'))),
                    const PopupMenuItem<String>(
                        value: 'Share',
                        child: ListTile(
                            leading: Icon(Icons.person_add),
                            title: Text('Share'))),
                    const PopupMenuItem<String>(
                        value: 'Get Link',
                        child: ListTile(
                            leading: Icon(Icons.link),
                            title: Text('Get link'))),
                    const PopupMenuDivider(),
                    const PopupMenuItem<String>(
                        value: 'Remove',
                        child: ListTile(
                            leading: Icon(Icons.delete), title: Text('Remove')))
                  ],
            ),
          ),
          PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            initialValue: _simpleValue,
            onSelected: showMenuSelection,
            child: ListTile(
                title: const Text('An item with a simple menu'),
                subtitle: Text(_simpleValue)),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                      value: _simpleValue1, child: Text(_simpleValue1)),
                  PopupMenuItem<String>(
                      value: _simpleValue2, child: Text(_simpleValue2)),
                  PopupMenuItem<String>(
                      value: _simpleValue3, child: Text(_simpleValue3))
                ],
          ),
          ListTile(
            title: const Text('An item with a sectioned menu'),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Preview',
                  child: ListTile(
                    leading: Icon(Icons.visibility),
                    title: Text('Preview')
                  )
                ),
                const PopupMenuItem<String>(
                  value: 'Share',
                  child: ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('Share')
                  )
                ),
                const PopupMenuItem<String>(
                  value: 'Get Link',
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: Text('Get link')
                  )
                ),
                const PopupMenuDivider(),
                const PopupMenuItem<String>(
                  value: 'Remove',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Remove')
                  )
                )
              ]
            )
          ),
        ],
      ),
    );
  }
}
