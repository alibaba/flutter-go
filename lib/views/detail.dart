import 'package:flutter/material.dart';

class Detail extends StatelessWidget {

  final String id ;
  Detail(this.id) ;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text('List Detail'),
      ),
      body: new Center(
        child: new Text('msg:'+ 'id='+id),
      ),
    ) ;
  }


}