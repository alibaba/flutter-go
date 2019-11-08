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

  WidgetItemContainer({
    Key key,
    @required this.commonItems,
    @required this.columnCount,
//      @required this.isWidgetPoint
  }) : super(key: key);

  /// 跳转goup
  void tapToGroup(CategoryComponent cate, BuildContext context) {
    Application.router.navigateTo(context, "/category/${cate.token}",
        transition: TransitionType.native);
  }

  /// 跳转到老的widget界面
  void tapToOldWidget(WidgetLeaf leaf, BuildContext context) {
    String targetName = leaf.name;
    String targetRouter = '/category/error/404';
    widgetDemosList.forEach((item) {
      if (item.name == targetName) {
        targetRouter = item.routerName;
        targetRouter = targetRouter.toLowerCase();
      }
    });
    Application.router.navigateTo(context, targetRouter,
        transition: TransitionType.native);
  }

  /// 跳转到新的标准页
  void tapToStandardPage(WidgetLeaf leaf, BuildContext context) {
    String targetRouter = '/standard-page/${leaf.pageId}';
    Application.router.navigateTo(context, targetRouter,
        transition: TransitionType.native);
  }

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
                    String type = item.type;

                    if (type == "category") {
                      return tapToGroup(item as CategoryComponent, context);
                    }
                    if (type == "widget") {
                      WidgetLeaf leaf = item as WidgetLeaf;

                      if (leaf.display == "standard") {
                        return tapToStandardPage(leaf, context);
                      } else {
                        return tapToOldWidget(leaf, context);
                      }
                    }

                    Application.router.navigateTo(
                        context, "/category/error/404",
                        transition: TransitionType.native);
                  },
                  index: addI,
                  totalCount: length,
                  rowLength: columnCount,

                  /// textSize: true ? 'middle' : 'small',
                  textSize: 'middle'),
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
