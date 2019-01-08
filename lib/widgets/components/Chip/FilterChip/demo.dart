/*
 * @Author: xiaojia.dxj
 * @Date: 2018-12-20 10:19:46 
 * @Last Modified by: xiaojia.dxj
 * @Last Modified time: 2018-12-20 14:09:31
 */
import 'package:flutter/material.dart';

class FilterChipDemo extends StatefulWidget {
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class ActorFilerEntry{
  final String name;
  final String initials;
  const ActorFilerEntry(this.name,this.initials);
}


class _FilterChipDemoState extends State<FilterChipDemo> {
  final List<ActorFilerEntry> _list=<ActorFilerEntry>[
    const ActorFilerEntry('android', 'ad'),
    const ActorFilerEntry('java', 'ja'),
    const ActorFilerEntry('php', 'ph'),
    const ActorFilerEntry('web', 'wb'),
  ];

  List<String> _filters=<String>[];
  Iterable<Widget> get actorWidgets sync*{
    for(ActorFilerEntry actor in _list){
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          // avatar: CircleAvatar(child: Text(actor.initials),),
          label: Text(actor.name),
          selected: _filters.contains(actor.name),
          onSelected: (bool value){
            setState(() {
                          if(value){
                            _filters.add(actor.name);
                          }else{
                            _filters.retainWhere((String name){
                              return name==actor.name;
                            });
                          }
                        });
          },
        ),
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
        Text('look for :${_filters.join(',')}')
      ],
    );
  }
}


  
