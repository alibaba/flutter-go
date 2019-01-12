/**
 * Created with Android Studio.
 * User: 一晟
 * Date: 2018/11/22
 * Time: 上午12:03
 * email: zhu.yan@alibaba-inc.com
 * tartget: DropdownButton 的示例
 */
import 'package:flutter/material.dart';

/*
* DropdownButton 默认按钮的实例
* isDisabled:是否是禁用，isDisabled 默认为true
* */
var selectItValue;
var selectItemValue;

class DropdownButtonDefault extends StatelessWidget {
   List<DropdownMenuItem> generateItemList() {
    final List<DropdownMenuItem> items = new List();
    final DropdownMenuItem item1 = new DropdownMenuItem(
        value: '张三', child: new Text('张三'));
    final DropdownMenuItem item2 = new DropdownMenuItem(
        value: '李四', child: new Text('李四'));
    final DropdownMenuItem item3 = new DropdownMenuItem(
        value: '王二', child: new Text('王二'));
    final DropdownMenuItem item4 = new DropdownMenuItem(
        value: '麻子', child: new Text('麻子'));
    items.add(item1);
    items.add(item2);
    items.add(item3);
    items.add(item4);
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        hint: new Text('下拉菜单选择一个人名'),
        //设置这个value之后,选中对应位置的item，
        //再次呼出下拉菜单，会自动定位item位置在当前按钮显示的位置处
        value: selectItValue,
        items: generateItemList(),
        onChanged: (T){
//          setState(() {
//          selectItemValue=T;
//          });
        },
    );
  }
}

List<DropdownMenuItem> getListData(){
  List<DropdownMenuItem> items=new List();
  DropdownMenuItem dropdownMenuItem1=new DropdownMenuItem(
    child:new Text('1'),
    value: '1',
  );
  items.add(dropdownMenuItem1);
  DropdownMenuItem dropdownMenuItem2=new DropdownMenuItem(
    child:new Text('2'),
    value: '2',
  );
  items.add(dropdownMenuItem2);
  DropdownMenuItem dropdownMenuItem3=new DropdownMenuItem(
    child:new Text('3'),
    value: '3',
  );
  items.add(dropdownMenuItem3);
  DropdownMenuItem dropdownMenuItem4=new DropdownMenuItem(
    child:new Text('4'),
    value: '4',
  );
  items.add(dropdownMenuItem4);
  DropdownMenuItem dropdownMenuItem5=new DropdownMenuItem(
    child:new Text('5'),
    value: '5',
  );
  items.add(dropdownMenuItem5);
  DropdownMenuItem dropdownMenuItem6=new DropdownMenuItem(
    child:new Text('6'),
    value: '6',
  );
  items.add(dropdownMenuItem6);
  DropdownMenuItem dropdownMenuItem7=new DropdownMenuItem(
    child:new Text('7'),
    value: '7',
  );
  items.add(dropdownMenuItem7);
  DropdownMenuItem dropdownMenuItem8=new DropdownMenuItem(
    child:new Text('8'),
    value: '8',
  );
  items.add(dropdownMenuItem8);
  DropdownMenuItem dropdownMenuItem9=new DropdownMenuItem(
    child:new Text('9'),
    value: '9',
  );
  items.add(dropdownMenuItem9);
  DropdownMenuItem dropdownMenuItem10=new DropdownMenuItem(
    child:new Text('10'),
    value: '10',
  );
  items.add(dropdownMenuItem10);
  return items;
}

/*
* DropdownButton 自定义的实例
* */
class DropdownButtonCustom extends StatelessWidget {
  final widget;
  final parent;
  const DropdownButtonCustom([this.widget,this.parent])
      : super();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        items: getListData(),
        //当没有默认值的时候可以设置的提示
        hint:Text('下拉选择你想要的数据'),
        //下拉菜单选择完之后显示给用户的值
        value: selectItemValue,
        //下拉菜单item点击之后的回调
        onChanged: (T){
          parent.setState((){
            selectItemValue = T;
          });
        },
        //设置阴影的高度
        elevation: 24,
        style: TextStyle(//设置文本框里面文字的样式
            color: Colors.red
        ),
        // isDense: true,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
        // 将下拉列表的内部内容设置为水平填充其父级
        isExpanded:true,
        iconSize: 50.0,//设置三角标icon的大小
    );
  }
}
