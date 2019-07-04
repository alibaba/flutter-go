import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './widget_item.dart';
import '../routers/application.dart';
import '../widgets/index.dart';
import '../model/widget.dart';

class WidgetItemContainer extends StatelessWidget {
  final int columnCount; //一行几个
  final List<CommonItem> commonItems;
//  final bool isWidgetPoint;

  // 所有的可用demos;
  final List widgetDemosList = new WidgetDemoList().getDemos();

  WidgetItemContainer(
      {Key key,
      @required this.commonItems,
      @required this.columnCount,
//      @required this.isWidgetPoint
      })
      : super(key: key);

  List<Widget> _buildColumns(context) {
    List<Widget> _listWidget = [];
    List<Widget> _listRows = [];
    int addI;
    for (int i = 0, length = commonItems.length; i < length; i += columnCount) {
      _listRows = [];
      for (int innerI = 0; innerI < columnCount; innerI++) {
        addI = innerI + i;
        if (addI < length) {
          CommonItem item = commonItems[addI];
          _listRows.add(
            Expanded(
              flex: 1,
              child: WidgetItem(
                title: item.name,
                onTap: () {
                  if (item.type == 'widget') {
                    WidgetLeaf _item = item;
                    String targetName = _item.name;
                    String targetRouter = '/category/error/404';
                    widgetDemosList.forEach((item) {
                      if (item.name == targetName) {
                        targetRouter = item.routerName;
                      }
                    });
                    print("targetRouter>>> $targetRouter");

                    return Application.router.navigateTo(context, targetRouter, transition: TransitionType.inFromRight);
                  }
                  Application.router
                        .navigateTo(context, "/category/${item.token}", transition: TransitionType.inFromRight);
                },
                index: addI,
                totalCount: length,
                rowLength: columnCount,
                textSize: true ? 'middle' : 'small',
              ),
            ),
          );
        } else {
          _listRows.add(
            Expanded(
              flex: 1,
              child: Container(),
            ),
          );
        }
      }
      _listWidget.add(
        Row(
          children: _listRows,
        ),
      );
    }
    return _listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildColumns(context),
    );
  }
}
