/// @Author: 一凨 
/// @Date: 2018-12-22 21:01:51 
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-27 15:37:04
 
import 'package:flutter/material.dart';

class CheckedPopupMenuItemDemo extends StatefulWidget {
  _CheckedPopupMenuItemDemoState createState() =>
      _CheckedPopupMenuItemDemoState();
}

class _CheckedPopupMenuItemDemoState extends State<CheckedPopupMenuItemDemo> {
  List<String> _checkedValues;

  final String _checkedValue1 = 'One';
  final String _checkedValue2 = 'Two';
  final String _checkedValue3 = 'Free';
  final String _checkedValue4 = 'Four';

  @override
  void initState() {
    super.initState();
    _checkedValues = <String>[_checkedValue3];
  }


  bool isChecked(String value) => _checkedValues.contains(value);

  void showCheckedMenuSelections(String value){
    if(_checkedValues.contains(value)){
      _checkedValues.remove(value);
    }else{
      _checkedValues.add(value);
    }
   
    Scaffold.of(context).showSnackBar( SnackBar(
                content:  Text('Checked $_checkedValues')));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        title: const Text('CheckedPopupMenuItem Demo',style: TextStyle(color:  Colors.white),),
        trailing: PopupMenuButton<String>(
          padding: EdgeInsets.zero,
          onSelected: showCheckedMenuSelections,
          icon: Icon(Icons.menu,color: Colors.white,),
          itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
            CheckedPopupMenuItem<String>(
                  value: _checkedValue1,
                  checked: isChecked(_checkedValue1),
                  child: Text(_checkedValue1)
                ),
                CheckedPopupMenuItem<String>(
                  value: _checkedValue2,
                  enabled: false,
                  checked: isChecked(_checkedValue2),
                  child: Text(_checkedValue2)
                ),
                CheckedPopupMenuItem<String>(
                  value: _checkedValue3,
                  checked: isChecked(_checkedValue3),
                  child: Text(_checkedValue3)
                ),
                CheckedPopupMenuItem<String>(
                  value: _checkedValue4,
                  checked: isChecked(_checkedValue4),
                  child: Text(_checkedValue4)
                )
          ],
        ),
      ),
    );
  }
}
