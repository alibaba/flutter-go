/**
 * Created with 菜鸟手册.
 * User: 一晟
 * Date: 2018/11/14
 * Time: 下午4:31
 * email: zhu.yan@alibaba-inc.com
 * target: TextField 的示例
 * 对应文档地址:https://docs.flutter.io/flutter/material/TextField-class.html
 */

import '../../../../../common/widget_demo.dart';
import 'package:flutter/material.dart';
import './text_field_demo.dart';

const String _textFieldText0 = """### **简介**
> TextField 最常用的文本输入widget
- 该 widget 作为文本输入框，可以接收用户以屏幕按键或者键盘输入的文本信息，该信息可以用于消息传递，搜索体验等
- 用户修改文本信息时，Onchange会被调用，获取到最新的文本信息
- 已知用户输入的字段文本输入完毕时（例如，通过按软键盘上的按钮确认输入完毕），该widget会调用onSubmitted回调
""";

const String _textFieldText1 = """### **基本用法**
> 参数控制默认的按钮和禁用按钮
- 默认情况下，TextField 下方有一个下划线进行修饰。
- 您可以使用decoration属性来控制该widget样式，例如通过添加标签或图标。如果将decoration属性设置为空，则将完全删除装饰，包括装饰引入的额外填充，以节省标签的空间。
- 如果decoration属性是非null（这是默认的），文本字段需要它的父类是一个Material widget。当文本字段被点击时，会出发被点击的效果。
- 若要将TextField和其他FormFild集成到Form中，请考虑使用TeTFrimeField。""";

const String _textFieldText2 = """### **进阶用法**
> 实现稍微复杂点的效果，TextField 的输入以数字优先，为输入框做一些其他的效果，如提示文字，icon、标签文字等
- 增加一个keyboardType属性，把keyboardType设置为 TextInputType.number ，让TextField获得焦点的时候弹出的键盘就变成了数字优先。
- 新增decoration属性，设置相关属性，可以发现当我们的TextField获得焦点时，图标会自动变色，提示文字会自动上移。
- onChanged是输入框内每次文字变更触发的回调方法，onSubmitted是用户提交而触发的回调方法。
- 每当用户改变输入框内的文字，都会在控制台输出现在的字符串.与onSubmitted用法相同。
""";

class Demo extends StatefulWidget {
  static const String routeName = 'elements/Form/Input/TextField';

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  String buttonShapeType = 'border'; // 边框类型
  void setButtonShapeType() {
    String _buttonShapeType =
        (buttonShapeType == 'border') ? 'radius' : 'border';
    this.setState(() {
      buttonShapeType = _buttonShapeType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: 'TextField',
      codeUrl: 'elements/Form/Input/TextField/text_field_demo.dart',
      contentList: [
        _textFieldText0,
        _textFieldText1,
        DefaultTextField(),
        _textFieldText2,
        CustomTextField()
      ],
      docUrl: 'https://docs.flutter.io/flutter/material/TextField-class.html',
    );
  }
}
