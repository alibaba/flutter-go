import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListViewItem extends StatelessWidget {
  final String itemUrl;
  final String itemTitle;
  final String data;

  const ListViewItem({Key key, this.itemUrl, this.itemTitle, this.data})
      : super(key: key);

  void _launchURL(String url, BuildContext context) async {

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          _launchURL(itemUrl, context);
        },
        title: Padding(
          child: Text(
            itemTitle,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(data,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0)),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}
