import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/resources/widget_name_to_icon.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:meta/meta.dart';

import '../model/search_history.dart';

typedef String FormFieldFormatter<T>(T v);
typedef bool MaterialSearchFilter<T>(T v, String c);
typedef int MaterialSearchSort<T>(T a, T b, String c);
typedef Future<List<MaterialSearchResult>> MaterialResultsFinder(String c);
typedef void OnSubmit(String value);

///搜索结果内容显示面板
class MaterialSearchResult<T> extends StatelessWidget {
  const MaterialSearchResult(
      {Key key, this.value, this.text, this.icon, this.onTap})
      : super(key: key);

  final String value;
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        height: 64.0,
        padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
        child: Row(
          children: <Widget>[
            Container(
                    width: 30.0,
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(icon)) ??
                null,
            Expanded(
                child: Text(value, style: Theme.of(context).textTheme.subhead)),
            Text(text, style: Theme.of(context).textTheme.subhead)
          ],
        ),
      ),
    );
  }
}

class MaterialSearch<T> extends StatefulWidget {
  MaterialSearch({
    Key key,
    this.placeholder,
    this.results,
    this.getResults,
    this.filter,
    this.sort,
    this.limit: 10,
    this.onSelect,
    this.onSubmit,
    this.barBackgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.leading,
  })  : assert(() {
          if (results == null && getResults == null ||
              results != null && getResults != null) {
            throw AssertionError(
                'Either provide a function to get the results, or the results.');
          }

          return true;
        }()),
        super(key: key);

  final String placeholder;

  final List<MaterialSearchResult<T>> results;
  final MaterialResultsFinder getResults;
  final MaterialSearchFilter<T> filter;
  final MaterialSearchSort<T> sort;
  final int limit;
  final ValueChanged<T> onSelect;
  final OnSubmit onSubmit;
  final Color barBackgroundColor;
  final Color iconColor;
  final Widget leading;

  @override
  _MaterialSearchState<T> createState() => _MaterialSearchState<T>();
}

class _MaterialSearchState<T> extends State<MaterialSearch> {
  bool _loading = false;
  List<MaterialSearchResult<T>> _results = [];

  String _criteria = '';
  TextEditingController _controller = TextEditingController();

  _filter(dynamic v, String c) {
    return v
        .toString()
        .toLowerCase()
        .trim()
        .contains(RegExp(r'' + c.toLowerCase().trim() + ''));
  }

  @override
  void initState() {
    super.initState();

    if (widget.getResults != null) {
      _getResultsDebounced();
    }

    _controller.addListener(() {
      setState(() {
        _criteria = _controller.value.text;
        if (widget.getResults != null) {
          _getResultsDebounced();
        }
      });
    });
  }

  Timer _resultsTimer;

  Future _getResultsDebounced() async {
    if (_results.length == 0) {
      setState(() {
        _loading = true;
      });
    }

    if (_resultsTimer != null && _resultsTimer.isActive) {
      _resultsTimer.cancel();
    }

    _resultsTimer = Timer(Duration(milliseconds: 400), () async {
      if (!mounted) {
        return;
      }

      setState(() {
        _loading = true;
      });

      var results = await widget.getResults(_criteria);

      if (!mounted) {
        return;
      }

      if (results != null) {
        setState(() {
          _loading = false;
          _results = results;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _resultsTimer?.cancel();
  }

  Widget buildBody(List results) {
    if (_criteria.isEmpty) {
      return History();
    } else if (_loading) {
      return Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: CircularProgressIndicator()));
    }
    if (results.isNotEmpty) {
      var content = SingleChildScrollView(child: Column(children: results));
      return content;
    }
    return Center(child: Text("暂无数据"));
  }

  @override
  Widget build(BuildContext context) {
    var results =
        (widget.results ?? _results).where((MaterialSearchResult result) {
      if (widget.filter != null) {
        return widget.filter(result.value, _criteria);
      }
      //only apply default filter if used the `results` option
      //because getResults may already have applied some filter if `filter` option was omited.
      else if (widget.results != null) {
        return _filter(result.value, _criteria);
      }

      return true;
    }).toList();

    if (widget.sort != null) {
      results.sort((a, b) => widget.sort(a.value, b.value, _criteria));
    }

    results = results.take(widget.limit).toList();

    IconThemeData iconTheme =
        Theme.of(context).iconTheme.copyWith(color: widget.iconColor);

    return Scaffold(
      appBar: AppBar(
        leading: widget.leading,
        backgroundColor: widget.barBackgroundColor,
        iconTheme: iconTheme,
        title: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration.collapsed(hintText: widget.placeholder),
          style: Theme.of(context).textTheme.title,
          onSubmitted: (String value) {
            if (widget.onSubmit != null) {
              widget.onSubmit(value);
            }
          },
        ),
        actions: _criteria.length == 0
            ? []
            : [
                IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _controller.text = _criteria = '';
                      });
                    }),
              ],
      ),
      body: buildBody(results),
    );
  }
}

class _MaterialSearchPageRoute<T> extends MaterialPageRoute<T> {
  _MaterialSearchPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings: const RouteSettings(),
    maintainState: true,
    bool fullscreenDialog: false,
  })  : assert(builder != null),
        super(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog);
}

class MaterialSearchInput<T> extends StatefulWidget {
  MaterialSearchInput({
    Key key,
    this.onSaved,
    this.validator,
    this.autovalidate,
    this.placeholder,
    this.formatter,
    this.results,
    this.getResults,
    this.filter,
    this.sort,
    this.onSelect,
  });

  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final bool autovalidate;
  final String placeholder;
  final FormFieldFormatter<T> formatter;

  final List<MaterialSearchResult<T>> results;
  final MaterialResultsFinder getResults;
  final MaterialSearchFilter<T> filter;
  final MaterialSearchSort<T> sort;
  final ValueChanged<T> onSelect;

  @override
  _MaterialSearchInputState<T> createState() => _MaterialSearchInputState<T>();
}

class _MaterialSearchInputState<T> extends State<MaterialSearchInput<T>> {
  GlobalKey<FormFieldState<T>> _formFieldKey = GlobalKey<FormFieldState<T>>();

  _buildMaterialSearchPage(BuildContext context) {
    return _MaterialSearchPageRoute<T>(
        settings: RouteSettings(
          name: 'material_search',
          isInitialRoute: false,
        ),
        builder: (BuildContext context) {
          return Material(
            child: MaterialSearch<T>(
              placeholder: widget.placeholder,
              results: widget.results,
              getResults: widget.getResults,
              filter: widget.filter,
              sort: widget.sort,
              onSelect: (dynamic value) => Navigator.of(context).pop(value),
            ),
          );
        });
  }

  _showMaterialSearch(BuildContext context) {
    Navigator.of(context)
        .push(_buildMaterialSearchPage(context))
        .then((dynamic value) {
      if (value != null) {
        _formFieldKey.currentState.didChange(value);
        widget.onSelect(value);
      }
    });
  }

  bool get autovalidate {
    return widget.autovalidate ??
        Form.of(context)?.widget?.autovalidate ??
        false;
  }

  bool _isEmpty(field) {
    return field.value == null;
  }

  Widget build(BuildContext context) {
    final TextStyle valueStyle = Theme.of(context).textTheme.subhead;

    return InkWell(
      onTap: () => _showMaterialSearch(context),
      child: FormField<T>(
        key: _formFieldKey,
        validator: widget.validator,
        onSaved: widget.onSaved,
        autovalidate: autovalidate,
        builder: (FormFieldState<T> field) {
          return InputDecorator(
            isEmpty: _isEmpty(field),
            decoration: InputDecoration(
              labelText: widget.placeholder,
              border: InputBorder.none,
              errorText: field.errorText,
            ),
            child: _isEmpty(field)
                ? null
                : Text(
                    widget.formatter != null
                        ? widget.formatter(field.value)
                        : field.value.toString(),
                    style: valueStyle),
          );
        },
      ),
    );
  }
}

///搜索框
class SearchInput extends StatelessWidget {
  final getResults;

  final ValueChanged<String> onSubmitted;

  final VoidCallback onSubmitPressed;

  SearchInput(this.getResults, this.onSubmitted, this.onSubmitPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(4.0)),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0, top: 3.0, left: 10.0),
            child: Icon(Icons.search,
                size: 24.0, color: Theme.of(context).accentColor),
          ),
          Expanded(
            child: MaterialSearchInput(
              placeholder: '搜索 flutter 组件',
              getResults: getResults,
            ),
          ),
        ],
      ),
    );
  }
}
// wigdet干掉.=> componets

class History extends StatefulWidget {
  const History() : super();

  @override
  _History createState() => _History();
}

// AppBar 默认的实例,有状态
class _History extends State<History> {
  SearchHistoryList searchHistoryList = SearchHistoryList();
  bool refreshFlag;

  @override
  void initState() {
    super.initState();
    this.refreshFlag = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  buildChips(BuildContext context) {
    List<Widget> list = [];
    List<SearchHistory> historyList = searchHistoryList.getList();
    print("historyList> $historyList");
    Color bgColor = Theme.of(context).primaryColor;
    historyList.forEach((SearchHistory value) {
      Widget icon = CircleAvatar(
        backgroundColor: bgColor,
        child: Text(
          value.name.substring(0, 1),
          style: TextStyle(color: Colors.white),
        ),
      );
      if (WidgetName2Icon.icons[value.name] != null) {
        icon = Icon(WidgetName2Icon.icons[value.name], size: 25);
      }
      String targetRouter = value.targetRouter;

      list.add(InkWell(
        onTap: () {
          Application.router.navigateTo(
              context, "${targetRouter.toLowerCase()}",
              transition: TransitionType.native);
        },
        child: Chip(
          avatar: icon,
          label: Text("${value.name}"),
        ),
      ));
    });
    return list;
  }

  _clearHistory() {
    searchHistoryList.clear();
    this.setState(() {
      this.refreshFlag = !this.refreshFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childList = buildChips(context);
    if (childList.length == 0) {
      return Center(
        child: Text("当前历史面板为空"),
      );
    }
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(12.0, 12, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onLongPress: () {
                    searchHistoryList.clear();
                  },
                  child: Text('历史搜索'),
                ),
                GestureDetector(
                  onTap: _clearHistory,
                  child: Container(
                    child: Icon(Icons.delete,
                        size: 24.0, color: Theme.of(context).accentColor),
                    width: 30,
                    height: 30,
                  ),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: Wrap(
              spacing: 6.0, // gap between adjacent chips
              runSpacing: 0.0, // gap between lines
              children: childList),
        )
      ],
    );
  }
}
