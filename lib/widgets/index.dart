import 'elements/index.dart' as elements;

class WidgetDemoList {
  WidgetDemoList();
  List getDemos() {
    return elements.getWidgets();
  }
}