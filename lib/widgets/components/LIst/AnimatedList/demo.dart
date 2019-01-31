

import 'package:flutter/material.dart';
import 'package:flutter_go/widgets/components/LIst/AnimatedList/model.dart';

class AnimatedListFullDefault extends StatefulWidget {
  AnimatedListFullDefault({Key key, this.parent}) : super(key: key);
  final parent;

  @override
  _AnimatedListFullDefault createState() => _AnimatedListFullDefault();
}

/*
* AnimatedList 默认的实例,有状态
* */
class _AnimatedListFullDefault extends State<AnimatedListFullDefault> {
  final GlobalKey<AnimatedListState> _listKey =  GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem; // The next item inserted when the user presses the '+' button.

  @override
  void initState() {
    super.initState();
    if (widget.parent is State) {
      widget.parent.animatedList = this; // 修改父级的对象引用
    }
    _list =  ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[0, 1, 2],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  void insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  // Remove the selected item from the list model.
  void remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return  CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(int item, BuildContext context, Animation<double> animation) {
    return  CardItem(
      animation: animation,
      item: item,
      selected: false,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500.0,
        child:AnimatedList(
          //shrinkWrap: true,
          key: _listKey,
          initialItemCount: _list.length,
          itemBuilder: _buildItem,
        ));
  }
  void methodA() {}
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false
  }) : assert(animation != null),
        assert(item != null && item >= 0),
        assert(selected != null),
        super(key: key);

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return  Padding(
      padding: const EdgeInsets.all(2.0),
      child:  SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child:  GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child:  SizedBox(
            height: 128.0,
            child:  Card(
              color: Colors.primaries[item % Colors.primaries.length],
              child:  Center(
                child:  Text('Item $item', style: textStyle),
              ),
            ),
          ),
        ),
      ),
    );
  }
}