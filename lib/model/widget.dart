import 'dart:async';

import "package:flutter/material.dart";
import "package:flutter_go/routers/application.dart";
import 'package:flutter_go/utils/sql.dart';

enum treeNode { CategoryComponent, WidgetLeaf }

//typedef aaa

abstract class WidgetInterface {
  int get id;

  //组件英文名
  String get name;

  //组件中文名
  String get cnName;

  //组件截图
  String get image;

  //组件markdown 文档
  String get doc;

  //类目 id
  int get catId;
}

class WidgetPoint implements WidgetInterface {
  int id;

  //组件英文名
  String name;

  //组件中文名
  String cnName;

  //组件截图
  String image;

  // 路由地址
  String routerName;

  //组件markdown 文档
  String doc;

  //组件 demo ，多个以 , 分割
  String demo;

  //类目 id
  int catId;
  final WidgetBuilder buildRouter;

  WidgetPoint(
      {this.id,
      this.name,
      this.cnName,
      this.image,
      this.doc,
      this.catId,
      this.routerName,
      this.buildRouter});

  WidgetPoint.fromJSON(Map json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        cnName = json['cnName'],
        routerName = json['routerName'],
        doc = json['doc'],
        catId = json['catId'],
        buildRouter = json['buildRouter'];

  String toString() {
    return '(WidgetPoint $name)';
  }

  Object toMap() {
    return {
      'id': id,
      'name': name,
      'cnName': cnName,
      'image': image,
      'doc': doc,
      'catId': catId
    };
  }

  Map toSqlCondition() {
    Map _map = this.toMap();
    Map condition = {};
    _map.forEach((k, value) {
      if (value != null) {
        condition[k] = value;
      }
    });

    if (condition.isEmpty) {
      return {};
    }

    return condition;
  }
}

class WidgetControlModel {
  final String table = 'widget';
  Sql sql;

  WidgetControlModel() {
    sql = Sql.setTable(table);
  }

  // 获取Widget不同条件的列表
  Future<List<WidgetPoint>> getList(WidgetPoint widgetPoint) async {
    List listJson =
        await sql.getByCondition(conditions: widgetPoint.toSqlCondition());
    List<WidgetPoint> widgets = listJson.map((json) {
      return new WidgetPoint.fromJSON(json);
    }).toList();
    // print("widgets $widgets");
    return widgets;
  }

  // 通过name获取Cat对象信息
  Future<WidgetPoint> getCatByName(String name) async {
    List json = await sql.getByCondition(conditions: {'name': name});
    if (json.isEmpty) {
      return null;
    }
    return new WidgetPoint.fromJSON(json.first);
  }

  Future<List<WidgetPoint>> search(String name) async {
    List json = await sql.search(conditions: {'name': name});

    if (json.isEmpty) {
      return [];
    }

    List<WidgetPoint> widgets = json.map((json) {
      return new WidgetPoint.fromJSON(json);
    }).toList();

    return widgets;
  }
}

// 抽象类
abstract class CommonItem<T> {
  int id;
  String name;
  int parentId;
  String type;
  List<CommonItem> children;
  String token;

  /// 父级节点, 存放整个CommonItem对象node = ! null
  ///
  CommonItem parent;
  String toString() {
    return "CommonItem {name: $name, type: $type, parentId: $parentId, token: $token, children长度 $children";
  }

  T getChild(String token);
  T addChildren(Object item);
  // 从children树中. 查找任意子节点
  T find(String token, [CommonItem node]);
}

// tree的group树干
class CategoryComponent extends CommonItem {
  int id;
  String name;
  int parentId;
  CommonItem parent;
  String token;

  List<CommonItem> children = [];

  String type = 'category';

  CategoryComponent(
      {@required this.id,
      @required this.name,
      @required this.parentId,
      this.type = 'categoryw',
      this.children,
      this.parent});
  CategoryComponent.fromJson(Map json) {
    if (json['id'] != null && json['id'].runtimeType == String) {
      this.id = int.parse(json['id']);
    } else {
      this.id = json['id'];
    }
    this.name = json['name'];
    this.parentId = json['parentId'];
    this.token = json['id'].toString() + json['type'];
  }
  void addChildren(Object item) {
    if (item is CategoryComponent) {
      CategoryComponent cate = item;
      cate.parent = this;
      this.children.add(cate);
    }
    if (item is WidgetLeaf) {
      WidgetLeaf widget = item;
      widget.parent = this;
      this.children.add(widget);
    }
  }

  @override
  CommonItem getChild(String token) {
    return children.firstWhere((CommonItem item) => item.token == token,
        orElse: () => null);
  }

  @override
  CommonItem find(String token, [CommonItem node]) {
    CommonItem ret;
    if (node != null) {
      if (node.token == token) {
        return node;
      } else {
        // 循环到叶子节点, 返回 空
        if (node.children == null) {
          return null;
        }
        for (int i = 0; i < node.children.length; i++) {
          CommonItem temp = this.find(token, node.children[i]);
          if (temp != null) {
            ret = temp;
          }
        }
      }
    } else {
      ret = find(token, this);
    }
    return ret;
  }
}

// 叶子节点
class WidgetLeaf extends CommonItem {
  int id;
  String name;
  int parentId;
  String display; // 展示类型, 区分老的widget文件下的详情
  String author; // 文档负责人
  String path; // 路由地址
  String pageId; // 界面ID
  CommonItem parent;

  String type = 'widget';
  WidgetLeaf(
      {@required this.id,
      @required this.name,
      @required this.display,
      this.author,
      this.path,
      this.pageId});

  WidgetLeaf.fromJson(Map json) {
    if (json['id'] != null && json['id'].runtimeType == String) {
      this.id = int.parse(json['id']);
    } else {
      this.id = json['id'];
    }
    this.name = json['name'];
    this.display = json['display'];
    this.author = json['author'] ?? null;
    this.path = json['path'] ?? null;
    this.pageId = json['pageId'] ?? null;
    this.token = json['id'].toString() + json['type'];
  }
  @override
  CommonItem getChild(String token) {
    return null;
  }

  @override
  addChildren(Object item) {
    // TODO: implement addChildren
    return null;
  }

  CommonItem find(String token, [CommonItem node]) {
    return null;
  }
}

class WidgetTree {
  // 构建树型结构
  static CategoryComponent buildWidgetTree(List json, [parent]) {
    CategoryComponent current;
    if (parent != null) {
      current = parent;
    } else {
      current =
          CategoryComponent(id: 0, name: 'root', parentId: null, children: []);
    }
    json.forEach((item) {
      // 归属分类级别
      if (['root', 'category'].indexOf(item['type']) != -1) {
        CategoryComponent cate = CategoryComponent.fromJson(item);
        if (cate.children != null) {
          buildWidgetTree(item['children'], cate);
        }
        current.addChildren(cate);
      } else {
        // 归属最后一层叶子节点
        WidgetLeaf cate = WidgetLeaf.fromJson(item);
        current.addChildren(cate);
      }
    });
    return current;
  }

  static insertDevPagesToList(List list, List devPages) {
    List devChildren = [];
    int index = 9999999;
    if (Application.env == ENV.PRODUCTION) {
      return list;
    }
    devPages.forEach((item) {
      index++;
      if (item['id'] != null) {
        devChildren.add({
          "id": index.toString(),
          "name": item['name'],
          "parentId": "99999999999",
          "type": "widget",
          "display": "standard",
          "author": item['author'],
          "pageId": item['id']
        });
      }
    });
    list.forEach((item) {
      if (item['name'].toString().toUpperCase() == 'DEVELOPER') {
        List children = item['children'];
        children.insert(0, {
          "id": "99999999999",
          "name": "本地代码",
          "parentId": item['id'],
          "type": "category",
          "children": devChildren
        });
      }
    });
    return list;
  }

  static CategoryComponent getCommonItemById(
      List<int> path, CategoryComponent root) {
    print("getCommonItemByPath $path");
    print("root $root");
    CommonItem childLeaf;

    /// int first = path.first;
    path = path.sublist(1);
    print("path:::: $path");
    if (path.length >= 0) {
//      childLeaf = root.getChild(path.first);
    }

    return childLeaf;
  }
}
