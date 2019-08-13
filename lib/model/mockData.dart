/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2019/5/13
 * Time: 2:54 PM
 * email: zhu.yan@alibaba-inc.com
 * tartget:
 */
import 'cat.dart';

const SourceMock = {
  "type": "database",
  "name": "app0",
  "objects": [
    {
      "type": "table",
      "database": null,
      "name": "cat",
      "withoutRowId": true,
      "ddl": "CREATE TABLE \"cat\" (\n\t`id`\tINTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,\n\t`name`\tTEXT NOT NULL UNIQUE,\n\t`depth`\tINTEGER NOT NULL DEFAULT 1,\n\t`parentId`\tINTEGER NOT NULL,\n\t`desc`\tTEXT\n)",
      "columns": [
        {
          "name": "id",
          "type": "INTEGER",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL "
            },
            {
              "type": "PRIMARY KEY",
              "definition": "PRIMARY KEY AUTOINCREMENT "
            },
            {
              "type": "UNIQUE",
              "definition": "UNIQUE"
            }
          ]
        },
        {
          "name": "name",
          "type": "TEXT",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL "
            },
            {
              "type": "UNIQUE",
              "definition": "UNIQUE"
            }
          ]
        },
        {
          "name": "depth",
          "type": "INTEGER",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL "
            },
            {
              "type": "DEFAULT",
              "definition": "DEFAULT 1"
            }
          ]
        },
        {
          "name": "parentId",
          "type": "INTEGER",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL"
            }
          ]
        },
        {
          "name": "desc",
          "type": "TEXT"
        }
      ],
      "rows": [
        [
          1,
          "element",
          1,
          0,
          "布局"
        ],
        [
          2,
          "components",
          1,
          0,
          "组件"
        ],
        [
          3,
          "themes",
          1,
          0,
          "主题"
        ],
        [
          4,
          "form",
          2,
          1,
          "Form表单"
        ],
        [
          5,
          "Input",
          3,
          4,
          "输入"
        ],
        [
          6,
          "Checkbox",
          3,
          4,
          null
        ],
        [
          7,
          "Button",
          3,
          4,
          "单选框"
        ],
        [
          8,
          "Text",
          3,
          4,
          "文本"
        ],
        [
          9,
          "Radio",
          3,
          4,
          "单选"
        ],
        [
          10,
          "Slider",
          3,
          4,
          "范围选择器"
        ],
        [
          11,
          "Switch",
          3,
          4,
          "按钮开关"
        ],
        [
          17,
          "Frame",
          2,
          1,
          "desc"
        ],
        [
          18,
          "Media",
          2,
          1,
          "Media(媒介)"
        ],
        [
          19,
          "Align",
          3,
          17,
          "Align"
        ],
        [
          20,
          "Stack",
          3,
          17,
          "Stack"
        ],
        [
          21,
          "Layout",
          3,
          17,
          "Layout(布局)"
        ],
        [
          22,
          "Box",
          3,
          17,
          "Box"
        ],
        [
          24,
          "Expanded",
          3,
          17,
          "Expanded"
        ],
        [
          25,
          "spacing",
          3,
          17,
          "spacing"
        ],
        [
          26,
          "Table",
          3,
          17,
          "Table"
        ],
        [
          27,
          "Image",
          3,
          18,
          "Image"
        ],
        [
          28,
          "Icon",
          3,
          18,
          "Icon"
        ],
        [
          29,
          "Canvas",
          3,
          18,
          "Canvas"
        ],
        [
          30,
          "Navigation",
          2,
          2,
          "Navigation"
        ],
        [
          31,
          "List",
          2,
          2,
          "List"
        ],
        [
          32,
          "Card",
          2,
          2,
          "Card"
        ],
        [
          33,
          "Bar",
          2,
          2,
          "Bar"
        ],
        [
          34,
          "Dialog",
          2,
          2,
          "Dialog"
        ],
        [
          35,
          "Scaffold",
          2,
          2,
          "Scaffold"
        ],
        [
          36,
          "Grid",
          2,
          2,
          "网格布局"
        ],
        [
          37,
          "Scroll",
          2,
          2,
          "滚动视图"
        ],
        [
          38,
          "Tab",
          2,
          2,
          "Tab"
        ],
        [
          39,
          "Menu",
          2,
          2,
          "Menu"
        ],
        [
          40,
          "Pick",
          2,
          2,
          "Pick"
        ],
        [
          41,
          "Chip",
          2,
          2,
          "Chip"
        ],
        [
          42,
          "Panel",
          2,
          2,
          "Panel"
        ],
        [
          43,
          "Progress",
          2,
          2,
          "Progress"
        ],
        [
          44,
          "Material",
          2,
          3,
          "Material"
        ],
        [
          45,
          "Cupertino",
          2,
          3,
          "Cupertino"
        ]
      ]
    },
    {
      "type": "table",
      "database": null,
      "name": "collection",
      "withoutRowId": true,
      "ddl": "CREATE TABLE collection (id INTEGER PRIMARY KEY NOT NULL UNIQUE, name TEXT NOT NULL, router TEXT)",
      "columns": [
        {
          "name": "id",
          "type": "INTEGER",
          "constraints": [
            {
              "type": "PRIMARY KEY",
              "definition": "PRIMARY KEY "
            },
            {
              "type": "NOT NULL",
              "definition": "NOT NULL "
            },
            {
              "type": "UNIQUE",
              "definition": "UNIQUE"
            }
          ]
        },
        {
          "name": "name",
          "type": "TEXT",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL"
            }
          ]
        },
        {
          "name": "router",
          "type": "TEXT"
        }
      ],
      "rows": []
    },
    {
      "type": "table",
      "database": null,
      "name": "widget",
      "withoutRowId": true,
      "ddl": "CREATE TABLE widget (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, name TEXT NOT NULL, cnName TEXT NOT NULL, image TEXT NOT NULL, doc TEXT, demo TEXT, catId INTEGER NOT NULL REFERENCES cat (id), owner TEXT)",
      "columns": [
        {
          "name": "id",
          "type": "INTEGER",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL "
            },
            {
              "type": "PRIMARY KEY",
              "definition": "PRIMARY KEY AUTOINCREMENT "
            },
            {
              "type": "UNIQUE",
              "definition": "UNIQUE"
            }
          ]
        },
        {
          "name": "name",
          "type": "TEXT",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL"
            }
          ]
        },
        {
          "name": "cnName",
          "type": "TEXT",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL"
            }
          ]
        },
        {
          "name": "image",
          "type": "TEXT",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL"
            }
          ]
        },
        {
          "name": "doc",
          "type": "TEXT"
        },
        {
          "name": "demo",
          "type": "TEXT"
        },
        {
          "name": "catId",
          "type": "INTEGER",
          "constraints": [
            {
              "type": "NOT NULL",
              "definition": "NOT NULL "
            },
            {
              "type": "FOREIGN KEY",
              "definition": "REFERENCES cat (id)"
            }
          ]
        },
        {
          "name": "owner",
          "type": "TEXT"
        }
      ],
      "rows": [
        [
          4,
          "TextField",
          "TextField",
          "image",
          "doc",
          "demo",
          5,
          "一晟"
        ],
        [
          5,
          "CheckboxListTile",
          "CheckboxListTile",
          "",
          "doc",
          "demo",
          6,
          "一晟"
        ],
        [
          6,
          "Checkbox",
          "Checkbox",
          "",
          "doc",
          "demo",
          6,
          "一晟"
        ],
        [
          7,
          "FlatButton",
          "FlatButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          8,
          "RaisedButton",
          "RaisedButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          9,
          "IconButton",
          "IconButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          10,
          "PopupMenuButton",
          "PopupMenuButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          11,
          "FloatingActionButton",
          "FloatingActionButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          12,
          "RawMaterialButton",
          "RawMaterialButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          13,
          "DropdownButton",
          "DropdownButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          14,
          "Text",
          "Text",
          "",
          "doc",
          "demo",
          8,
          "三帆"
        ],
        [
          15,
          "RichText",
          "RichText",
          "",
          "doc",
          "demo",
          8,
          "三帆"
        ],
        [
          16,
          "Radio",
          "Radio",
          "",
          "doc",
          "demo",
          9,
          "三帆"
        ],
        [
          17,
          "RadioListTile",
          "RadioListTile",
          "",
          "doc",
          "demo",
          9,
          "三帆"
        ],
        [
          18,
          "Slider",
          "Slider",
          "",
          "doc",
          "demo",
          10,
          "三帆"
        ],
        [
          19,
          "SliderTheme",
          "SliderTheme",
          "",
          "doc",
          "demo",
          10,
          "三帆"
        ],
        [
          21,
          "SliderThemeData",
          "SliderThemeData",
          "",
          "doc",
          "demo",
          10,
          "三帆"
        ],
        [
          22,
          "Switch",
          "Switch",
          "",
          "doc",
          "demo",
          11,
          "三帆"
        ],
        [
          23,
          "SwitchListTile",
          "SwitchListTile",
          "",
          "doc",
          "demo",
          11,
          "三帆"
        ],
        [
          24,
          "AnimatedSwitcher",
          "AnimatedSwitcher",
          "",
          "doc",
          "demo",
          11,
          "三帆"
        ],
        [
          25,
          "Align",
          "Align",
          "",
          "doc",
          "demo",
          19,
          "三露"
        ],
        [
          26,
          "Stack",
          "Stack",
          "",
          "doc",
          "demo",
          20,
          "三露"
        ],
        [
          27,
          "IndexedStack",
          "IndexedStack",
          "",
          "doc",
          "demo",
          20,
          "三露"
        ],
        [
          28,
          "Row",
          "Row",
          "",
          "doc",
          "demo",
          21,
          "三露"
        ],
        [
          29,
          "Column",
          "Column",
          "",
          "doc",
          "demo",
          21,
          "三露"
        ],
        [
          30,
          "Container",
          "Container",
          "",
          "doc",
          "demo",
          21,
          "三露"
        ],
        [
          31,
          "Center",
          "Center",
          "",
          "doc",
          "demo",
          21,
          "三露"
        ],
        [
          32,
          "ConstrainedBox",
          "ConstrainedBox(带限制的盒子)",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          33,
          "OverflowBox",
          "OverflowBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          34,
          "DecoratedBox",
          "DecoratedBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          35,
          "FittedBox",
          "FittedBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          36,
          "LimitedBox",
          "LimitedBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          38,
          "RotatedBox",
          "RotatedBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          39,
          "SizedOverflowBox",
          "SizedOverflowBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          41,
          "UnconstrainedBox",
          "UnconstrainedBox",
          "",
          "doc",
          "demo",
          22,
          "三露"
        ],
        [
          45,
          "Expanded",
          "Expanded",
          "",
          "doc",
          "demo",
          24,
          "一凨"
        ],
        [
          46,
          "Padding",
          "Padding",
          "",
          "doc",
          "demo",
          25,
          "一凨"
        ],
        [
          47,
          "SliverPadding",
          "SliverPadding",
          "",
          "doc",
          "demo",
          25,
          "一凨"
        ],
        [
          48,
          "AnimatedPadding",
          "AnimatedPadding",
          "",
          "doc",
          "demo",
          25,
          "一凨"
        ],
        [
          49,
          "Table",
          "Table",
          "",
          "doc",
          "demo",
          26,
          "一凨"
        ],
        [
          52,
          "AssetImage",
          "AssetImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          53,
          "DecorationImage",
          "DecorationImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          55,
          "ExactAssetImage",
          "ExactAssetImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          56,
          "FadeInImage",
          "FadeInImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          57,
          "FileImage",
          "FileImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          58,
          "NetworkImage",
          "NetworkImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          59,
          "RawImage",
          "RawImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          62,
          "MemoryImage",
          "MemoryImage",
          "",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          63,
          "Icon",
          "Icon",
          "",
          "doc",
          "demo",
          28,
          "剑平"
        ],
        [
          64,
          "ImageIcon",
          "ImageIcon",
          "",
          "doc",
          "demo",
          28,
          "剑平"
        ],
        [
          65,
          "IconTheme",
          "IconTheme",
          "",
          "doc",
          "demo",
          28,
          "剑平"
        ],
        [
          66,
          "IconData",
          "IconData",
          "",
          "doc",
          "demo",
          28,
          "剑平"
        ],
        [
          67,
          "IconThemeData",
          "IconThemeData",
          "",
          "doc",
          "demo",
          28,
          "剑平"
        ],
        [
          69,
          "Canvas",
          "Canvas",
          "",
          "doc",
          "demo",
          29,
          "剑平"
        ],
        [
          70,
          "OutlineButton",
          "OutlineButton",
          "",
          "doc",
          "demo",
          7,
          "一晟"
        ],
        [
          71,
          "BottomNavigationBarItem",
          "BottomNavigationBarItem",
          "image",
          "doc",
          "demo",
          30,
          "一晟"
        ],
        [
          73,
          "BottomNavigationBar",
          "BottomNavigationBar",
          "image",
          "doc",
          "demo",
          30,
          "一晟"
        ],
        [
          74,
          "AnimatedList",
          "AnimatedList",
          "image",
          "doc",
          "demo",
          31,
          "一晟"
        ],
        [
          75,
          "ListView",
          "ListView",
          "image",
          "doc",
          "demo",
          31,
          "一晟"
        ],
        [
          78,
          "Card",
          "Card",
          "image",
          "doc",
          "demo",
          32,
          "一晟"
        ],
        [
          79,
          "AppBar",
          "AppBar",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          80,
          "BottomAppBar",
          "BottomAppBar",
          "image",
          "dec",
          "demo",
          33,
          "一晟"
        ],
        [
          81,
          "BottomNavigationBarItem",
          "BottomNavigationBarItem",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          82,
          "SnackBar",
          "SnackBar",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          83,
          "SliverAppBar",
          "SliverAppBar",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          84,
          "ScrollbarPainter",
          "ScrollbarPainter",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          87,
          "FlexibleSpaceBar",
          "FlexibleSpaceBar",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          88,
          "ButtonBar",
          "ButtonBar",
          "image",
          "doc",
          "demo",
          33,
          "一晟"
        ],
        [
          89,
          "SnackBarAction",
          "SnackBarAction",
          "image",
          "doc",
          "demo",
          33,
          "三帆"
        ],
        [
          90,
          "TabBar",
          "TabBar",
          "image",
          "doc",
          "demo",
          33,
          "三帆"
        ],
        [
          93,
          "Scaffold",
          "Scaffold",
          "image",
          "doc",
          "demo",
          35,
          "三帆"
        ],
        [
          97,
          "ScaffoldState",
          "ScaffoldState",
          "image",
          "doc",
          "demo",
          35,
          "三帆"
        ],
        [
          98,
          "GridTile",
          "GridTile",
          "image",
          "doc",
          "demo",
          36,
          "三帆"
        ],
        [
          99,
          "GridView",
          "GridView",
          "image",
          "doc",
          "demo",
          36,
          "三帆"
        ],
        [
          100,
          "GridPaper",
          "GridPaper",
          "image",
          "doc",
          "demo",
          36,
          "三帆"
        ],
        [
          101,
          "SliverGrid",
          "SliverGrid",
          "image",
          "doc",
          "demo",
          36,
          "三帆"
        ],
        [
          102,
          "GridTileBar",
          "GridTileBar",
          "image",
          "doc",
          "demo",
          36,
          "三帆"
        ],
        [
          103,
          "AlertDialog",
          "AlertDialog",
          "image",
          "doc",
          "demo",
          34,
          "三帆"
        ],
        [
          104,
          "Dialog",
          "Dialog",
          "image",
          "doc",
          "demo",
          34,
          "三帆"
        ],
        [
          105,
          "AboutDialog",
          "AboutDialog",
          "image",
          "doc",
          "demo",
          34,
          "三帆"
        ],
        [
          106,
          "SimpleDialog",
          "SimpleDialog",
          "image",
          "doc",
          "demo",
          34,
          "三帆"
        ],
        [
          108,
          "ScrollView",
          "ScrollView",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          109,
          "Scrollable",
          "Scrollable",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          110,
          "ScrollbarPainter",
          "ScrollbarPainter",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          111,
          "ScrollMetrics",
          "ScrollMetrics",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          112,
          "ScrollPhysics",
          "ScrollPhysics",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          113,
          "BoxScrollView",
          "BoxScrollView",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          116,
          "CustomScrollView",
          "CustomScrollView",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          118,
          "NestedScrollView",
          "NestedScrollView",
          "image",
          "doc",
          "demo",
          37,
          "一凨"
        ],
        [
          120,
          "Tab",
          "Tab",
          "image",
          "doc",
          "demo",
          38,
          "一凨"
        ],
        [
          121,
          "CheckedPopupMenuItem",
          "CheckedPopupMenuItem",
          "image",
          "doc",
          "demo",
          39,
          "一凨"
        ],
        [
          122,
          "DropdownMenuItem",
          "DropdownMenuItem",
          "image",
          "doc",
          "demo",
          39,
          "一凨"
        ],
        [
          123,
          "PopupMenuButton",
          "PopupMenuButton",
          "image",
          "doc",
          "demo",
          39,
          "一凨"
        ],
        [
          124,
          "PopupMenuDivider",
          "PopupMenuDivider",
          "image",
          "doc",
          "demo",
          39,
          "一凨"
        ],
        [
          125,
          "PopupMenuEntry",
          "PopupMenuEntry",
          "image",
          "doc",
          "demo",
          39,
          "一凨"
        ],
        [
          126,
          "PopupMenuItem",
          "PopupMenuItem",
          "image",
          "doc",
          "demo",
          39,
          "三露"
        ],
        [
          128,
          "DayPicker",
          "DayPicker",
          "image",
          "doc",
          "demo",
          40,
          "三露"
        ],
        [
          129,
          "MonthPicker",
          "MonthPicker",
          "image",
          "doc",
          "demo",
          40,
          "三露"
        ],
        [
          130,
          "YearPicker",
          "YearPicker",
          "image",
          "doc",
          "demo",
          40,
          "三露"
        ],
        [
          131,
          "Chip",
          "Chip",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          132,
          "ChipTheme",
          "ChipTheme",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          133,
          "ChipThemeData",
          "ChipThemeData",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          134,
          "ChoiceChip",
          "ChoiceChip",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          135,
          "FilterChip",
          "FilterChip",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          136,
          "InputChip",
          "InputChip",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          137,
          "RawChip",
          "RawChip",
          "image",
          "doc",
          "demo",
          41,
          "三露"
        ],
        [
          139,
          "ExpansionPanelList",
          "ExpansionPanelList",
          "image",
          "doc",
          "demo",
          42,
          "三露"
        ],
        [
          141,
          "LinearProgressIndicator",
          "LinearProgressIndicator",
          "image",
          "doc",
          "demo",
          43,
          "三露"
        ],
        [
          142,
          "CircularProgressIndicator",
          "CircularProgressIndicator",
          "image",
          "doc",
          "demo",
          43,
          "三露"
        ],
        [
          146,
          "MaterialApp",
          "MaterialApp",
          "image",
          "doc",
          "demo",
          44,
          "一凨"
        ],
        [
          149,
          "MaterialColor",
          "MaterialColor",
          "image",
          "doc",
          "demo",
          44,
          "一凨"
        ],
        [
          150,
          "MaterialButton",
          "MaterialButton",
          "image",
          "doc",
          "demo",
          44,
          "一凨"
        ],
        [
          151,
          "MaterialPageRoute",
          "MaterialPageRoute",
          "image",
          "doc",
          "demo",
          44,
          "三露"
        ],
        [
          152,
          "MaterialAccentColor",
          "MaterialAccentColor",
          "image",
          "doc",
          "demo",
          44,
          "三露"
        ],
        [
          155,
          "MergeableMaterialItem",
          "MergeableMaterialItem",
          "image",
          "doc",
          "demo",
          44,
          "三露"
        ],
        [
          156,
          "ShowdatePicker",
          "ShowdatePicker",
          "image",
          "doc",
          "demo",
          40,
          "三露"
        ],
        [
          157,
          "Image",
          "Image",
          "Image",
          "doc",
          "demo",
          27,
          "一凨"
        ],
        [
          158,
          "ListBody",
          "ListBody",
          "image",
          "doc",
          "demo",
          31,
          "一晟"
        ],
        [
          159,
          "CupertinoApp",
          "CupertinoApp",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          160,
          "CupertinoButton",
          "CupertinoButton",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          161,
          "CupertinoColors",
          "CupertinoColors",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          162,
          "CupertinoIcons",
          "CupertinoIcons",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          164,
          "CupertinoNavigationBar",
          "CupertinoNavigationBar",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          166,
          "CupertinoPageRoute",
          "CupertinoPageRoute",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          167,
          "CupertinoPageScaffold",
          "CupertinoPageScaffold",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          169,
          "CupertinoPicker",
          "CupertinoPicker",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          170,
          "CupertinoPopupSurface",
          "CupertinoPopupSurface",
          "image",
          "doc",
          "demo",
          45,
          "一晟"
        ],
        [
          171,
          "CupertinoScrollbar",
          "CupertinoScrollbar",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          172,
          "CupertinoSlider",
          "CupertinoSlider",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          173,
          "CupertinoSegmentedControl",
          "CupertinoSegmentedControl",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          174,
          "CupertinoSliverNavigationBar",
          "CupertinoSliverNavigationBar",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          176,
          "CupertinoSwitch",
          "CupertinoSwitch",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          177,
          "CupertinoTabBar",
          "CupertinoTabBar",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          178,
          "CupertinoTabScaffold",
          "CupertinoTabScaffold",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          179,
          "CupertinoTabView",
          "CupertinoTabView",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          181,
          "CupertinoTimerPicker",
          "CupertinoTimerPicker",
          "image",
          "doc",
          "demo",
          45,
          "三帆"
        ],
        [
          182,
          "PainterSketch",
          "PainterSketch",
          "image",
          "doc",
          "demo",
          29,
          "一晟"
        ],
        [
          183,
          "PainterPath",
          "PainterPath",
          "image",
          "doc",
          "demo",
          29,
          "一晟"
        ],
        [
          184,
          "CircleProgressBarPainter",
          "CircleProgressBarPainter",
          "image",
          "doc",
          "demo",
          29,
          "一晟"
        ],
        [
          185,
          "CityPicker",
          "地区选择器",
          "image",
          "doc",
          "demo",
          40,
          "三帆"
        ]
      ]
    }
  ]
};

List<Map> getCatMock(Map conditions) {
  final cat = (SourceMock['objects'] as List)[0]['rows'].toList();

  final List<Map> resultList = [];
  if (conditions['parentId'] is int) {
    cat.forEach((obj) {
      if(obj[3] == conditions['parentId']){
        resultList.add(
            {
              "id": obj[0],
              "name": obj[1],
              "depth": obj[2],
              "parentId": obj[3],
              "desc": obj[4]
            }
        );
      }
    });
  } else if (conditions['name'] is String) {
    cat.forEach((obj) {
      if(obj[1] == conditions['name']){
        resultList.add(
            {
              "id": obj[0],
              "name": obj[1],
              "depth": obj[2],
              "parentId": obj[3],
              "desc": obj[4]
            }
        );
      }
    });
  }
  ///print('resultList====>');
  ///print(resultList.length> 0);
  ///print('getCatByName----------getCatByName:${conditions},${resultList.length}');
  return resultList.length > 0 ? resultList.toList() : new List<Map>();
}

List<Map> getWidgetMock(Map conditions) {
  final widget = (SourceMock['objects'] as List)[2]['rows'];
  final List<Map> resultList = [];
  if (conditions['catId'] is int) {
    widget.forEach((obj) {
      if(obj[6] == conditions['catId']){
        resultList.add(
            {
              'id': obj[0], 'name': obj[1], 'cnName': obj[2], 'image': obj[3], 'doc': obj[4], 'demo': obj[5], 'catId': obj[6], 'owner': obj[7]
            }
        );
      }
    });
  } else if (conditions['name'] is String) {
    widget.forEach((obj) {
      /// print('resultList111====>:${conditions['name']},${obj[1]}');
      if(obj[1] == conditions['name'] || obj[1].toString().toLowerCase().indexOf(conditions['name'].toLowerCase()) !=-1){
        resultList.add(
          {'id': obj[0], 'name': obj[1], 'cnName': obj[2], 'image': obj[3], 'doc': obj[4], 'demo': obj[5], 'catId': obj[6], 'owner': obj[7]}
        );
      }
    });
  }
  print('resultList111====>:${conditions}');
  print(resultList);
  return resultList.length > 0 ? resultList.toList() : new List<Map>();
}


List<Map> getCatMock2(Map conditions) {

  final List<Map> list = [
    {"id": 1, "name": "element", "depth": 1, "parentId": 0, "desc": "布局"},
    {"id": 2, "name": "components", "depth": 1, "parentId": 0, "desc": "组件"},
    {"id": 3, "name": "themes", "depth": 1, "parentId": 0, "desc": "主题"},
    {"id": 4, "name": "form", "depth": 2, "parentId": 1, "desc": "Form表单"},
    {"id": 17, "name": "Frame", "depth": 2, "parentId": 1, "desc": "desc"},
    {"id": 18, "name": "Media", "depth": 2, "parentId": 1, "desc": "Media(媒介)"},
    {"id": 30, "name": "Navigation", "depth": 2, "parentId": 2, "desc": "Navigation"},
    {"id": 31, "name": "List", "depth": 2, "parentId": 2, "desc": "List"},
    {"id": 32, "name": "Card", "depth": 2, "parentId": 2, "desc": "Card"},
    {"id": 33, "name": "Bar", "depth": 2, "parentId": 2, "desc": "Bar"},
    {"id": 34, "name": "Dialog", "depth": 2, "parentId": 2, "desc": "Dialog"},
    {"id": 35, "name": "Scaffold", "depth": 2, "parentId": 2, "desc": "Scaffold"},
    {"id": 36, "name": "Grid", "depth": 2, "parentId": 2, "desc": "网格布局"},
    {"id": 37, "name": "Scroll", "depth": 2, "parentId": 2, "desc": "滚动视图"},
    {"id": 38, "name": "Tab", "depth": 2, "parentId": 2, "desc": "Tab"},
    {"id": 39, "name": "Menu", "depth": 2, "parentId": 2, "desc": "Menu"},
    {"id": 40, "name": "Pick", "depth": 2, "parentId": 2, "desc": "Pick"},
    {"id": 41, "name": "Chip", "depth": 2, "parentId": 2, "desc": "Chip"},
    {"id": 42, "name": "Panel", "depth": 2, "parentId": 2, "desc": "Panel"},
    {"id": 43, "name": "Progress", "depth": 2, "parentId": 2, "desc": "Progress"},
    {"id": 44, "name": "Material", "depth": 2, "parentId": 3, "desc": "Material"},
    {"id": 45, "name": "Cupertino", "depth": 2, "parentId": 3, "desc": "Cupertino"},
//    {id: 5, name: Input, depth: 3, parentId: 4, desc: 输入},
//    {id: 6, name: Checkbox, depth: 3, parentId: 4, desc: null},
//    {id: 7, name: Button, depth: 3, parentId: 4, desc: 单选框},
//    {id: 8, name: Text, depth: 3, parentId: 4, desc: 文本},
//    {id: 9, name: Radio, depth: 3, parentId: 4, desc: 单选},
//    {id: 10, name: Slider, depth: 3, parentId: 4, desc: 范围选择器},
//    {id: 11, name: Switch, depth: 3, parentId: 4, desc: 按钮开关},
//  {id: 19, name: Align, depth: 3, parentId: 17, desc: Align},
//  {id: 20, name: Stack, depth: 3, parentId: 17, desc: Stack},
//  {id: 21, name: Layout, depth: 3, parentId: 17, desc: Layout(布局)},
//  {id: 22, name: Box, depth: 3, parentId: 17, desc: Box},
//  {id: 24, name: Expanded, depth: 3, parentId: 17, desc: Expanded},
//  {id: 25, name: spacing, depth: 3, parentId: 17, desc: spacing},
//  {id: 26, name: Table, depth: 3, parentId: 17, desc: Table},
//  {id: 27, name: Image, depth: 3, parentId: 18, desc: Image},
//  {id: 28, name: Icon, depth: 3, parentId: 18, desc: Icon},
//  {id: 29, name: Canvas, depth: 3, parentId: 18, desc: Canvas},
//  {id: 71, name: BottomNavigationBarItem, cnName: BottomNavigationBarItem, image: image, doc: doc, demo: demo, catId: 30, owner: 一晟},
//  {id: 73, name: BottomNavigationBar, cnName: BottomNavigationBar, image: image, doc: doc, demo: demo, catId: 30, owner: 一晟},
//  {id: 74, name: AnimatedList, cnName: AnimatedList, image: image, doc: doc, demo: demo, catId: 31, owner: 一晟},
//  {id: 75, name: ListView, cnName: ListView, image: image, doc: doc, demo: demo, catId: 31, owner: 一晟},
//  {id: 158, name: ListBody, cnName: ListBody, image: image, doc: doc, demo: demo, catId: 31, owner: 一晟},
//  {id: 78, name: Card, cnName: Card, image: image, doc: doc, demo: demo, catId: 32, owner: 一晟}
  ];
  if (conditions['parentId'] is int) {
    final aa= list.where((obj) {
      return obj['parentId'] == conditions['parentId'];
    }).toList();
    print('---------');
    //print(aa);
    return aa;
  } else if (conditions['name'] is String) {
    return list.where((obj) {
      return obj['name'] == conditions['name'];
    }).toList();
  }else {
    return [];
  }
}

