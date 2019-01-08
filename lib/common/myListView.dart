
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyListView extends StatelessWidget {

final String currCodeUrl;
final String currTitle;
final String developer;

const MyListView({ Key key,this.currCodeUrl, this.currTitle, this.developer}):
super(key:key);


 void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.primaries[index % Colors.primaries.length],
        color: Colors.white,
        elevation: 4.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child:ListTile(
            onTap:(){
              print('codeUrl:${currCodeUrl}');
              _launchURL(currCodeUrl);
            },
            // contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
            // leading: Container(
            //   padding: EdgeInsets.only(right: 12.0),
            //   decoration: new BoxDecoration(
            //       border: new Border(
            //           right: new BorderSide(width: 1.0, color: Colors.grey))),
            //   child: Icon(smallParts_icon, color: smallParts_Color),
            // ),
            title: Padding(
              child: Text(
              
              currTitle,
              style: TextStyle(color: Colors.black,fontSize:15.0),
              
            ),
            padding: EdgeInsets.only(top: 10.0),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: Row(
              
              children: <Widget>[
                Padding(
                  child:  Text( developer, style: TextStyle(color: Colors.black54,fontSize:10.0)
                ),
                padding:EdgeInsets.only(top: 10.0,bottom: 10.0),
                )
                //Icon(Icons.linear_scale, color: smallParts_Color),
               
              ],
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0)
            )
    );
  }
}