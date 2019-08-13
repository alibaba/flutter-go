/// @Author: xiaojia.dxj
/// @Date: 2018-12-20 20:30:36 
/// @Last Modified by: xiaojia.dxj
/// @Last Modified time: 2018-12-21 11:23:21

import 'package:flutter_web/material.dart';

class FilterChipDemo extends StatefulWidget {
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class InputEntry{
  final String name;
  final String initials;
  const InputEntry(this.name,this.initials);
}
 
class _FilterChipDemoState extends State<FilterChipDemo> {

final List<InputEntry> _lists=<InputEntry>[
    const InputEntry('android', 'A'),
    const InputEntry('java', 'J'),
    const InputEntry('php', 'P'),
    const InputEntry('web', 'W'),
];

Iterable<Widget> get _rawChipWidget sync*{
  for(InputEntry value in _lists){
    yield Padding(
      padding: const EdgeInsets.all(4.0),
      child: RawChip(
        avatar: CircleAvatar(
           backgroundColor: Colors.redAccent.shade400,
           child: Text(value.initials),
        ),
        label: Text(value.name),
        onDeleted: (){
          // _inputs.add(value.name);
          setState(() {
                       _lists.remove(value);
                       
                    });
        },
        
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Wrap(
          children: _rawChipWidget.toList(),
        ),
    
      ],
    );
  }
}


  
