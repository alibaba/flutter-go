/*
 * @Author: 一凨 
 * @Date: 2018-12-27 15:45:26 
 * @Last Modified by:   一凨 
 * @Last Modified time: 2018-12-27 15:45:26 
 */
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class PopupMenuDividerDemo extends StatelessWidget {


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
  Widget build(BuildContext context) {
    return Container(
      child:ListTile(
            title: const Text('An item with a sectioned menu'),
            trailing: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showInSnackBar,
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
    );
  }
}