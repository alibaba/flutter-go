/// Created with Android Studio.
/// User: 三帆
/// Date: 07/01/2019
/// Time: 10:31
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

class GridTileDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<GridTileDemo> {
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        color: Color(0xffc91b3a),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 4.0,
          padding: const EdgeInsets.all(4.0),
          childAspectRatio: 1.3,
          children: <Widget>[
            GridTile(
              header: GridTileBar(
                title: Text('title'),
                subtitle: Text('subtitle'),
                leading: Icon(Icons.add),
                trailing: Text("trailing"),
              ),
              child: Container(),
            ),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
            Image.network(
                'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
                scale: 1,
                fit: BoxFit.cover),
          ],
        ));
  }
}
