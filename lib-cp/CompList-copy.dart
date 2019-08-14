import 'package:flutter_web/material.dart';
import 'package:flutter_rookie_book/views/Detail.dart';

class CompList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ListState();
  }
}

class ListState extends State<CompList> {
  @override
  Widget build(BuildContext context) {
    /// getData() ; this is test;
    return new ListView.builder(
      //itemCount: data == null ? 0 : data.length,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          /////child: new Container(
            /////padding: new EdgeInsets.all(10.0),
            child: new ListTile(
              subtitle: new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Expanded(
                          child: new Text("Title",

                              ///data[index]["title"],
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        )
                      ],
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Text("time:"),
                            new Text("2018-05-06")
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        new Container(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 2.0),
                          child: new Text("content"),

                          ///child: new Text("id:"+data[index]["id"].toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: new Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),

              ///onTap: () => _onTap(data[index]["id"].toString()),
              onTap: () => _onTap('1'),
            ),
          /////),
        );
      },
    );
  }

  void _onTap(String id){
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _,__){
          return new Detail(id);
        },
        transitionsBuilder: (_,Animation<double> animation,__,Widget child){
          return new FadeTransition(
            opacity: animation,
            child: new SlideTransition(position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),child: child,
            ),
          ) ;
        }
    ));
  }

}
