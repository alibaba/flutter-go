import 'Button/index.dart' as Button;
import 'Text/index.dart' as Text;

List getWidgets() {
  List result = [];
  result.addAll(Button.widgetPoints);
  result.addAll(Text.widgetPoints);
  return result;
}