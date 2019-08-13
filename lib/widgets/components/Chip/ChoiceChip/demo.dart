/// @Author: xiaojia.dxj
/// @Date: 2018-12-19 15:13:24 
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-20 19:32:10

import 'package:flutter_web/material.dart';

class ChoiceChipDemo extends StatefulWidget {
  _ChoiceChipDemoState createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {
   String _selected = '';
 
  List<String> _sub=<String>[
  'java','web','android'
];

  Iterable<Widget> get actorWidgets sync*{
    for(String choiceSub in _sub){
      yield Padding(
        padding:EdgeInsets.all(15.0) ,
        child: ChoiceChip(
        // avatar: Icon(Icons.access_alarm,size: 20.0,color: Colors.white,),
        //未选定的时候背景
        backgroundColor:Colors.red,
        //被禁用得时候背景
        disabledColor: Colors.blue,
        label: Text(choiceSub),
        labelStyle: TextStyle(fontWeight: FontWeight.w200,fontSize: 15.0),
        labelPadding: EdgeInsets.only(left: 20.0,right: 20.0),

        materialTapTargetSize: MaterialTapTargetSize.padded,
        onSelected: (bool value) {
          setState(() {
            _selected = value ? choiceSub : 'Colors.red';
          });
        },
        selected: _selected == choiceSub,)
        );
        
    }
  }

 @override
  Widget build(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: actorWidgets.toList(),
        ),
      ],
    );

  }
}


  
