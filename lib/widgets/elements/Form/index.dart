import 'Button/index.dart' as Button;
import 'Text/index.dart' as Text;
import 'Input/index.dart' as Input;
import 'CheckBox/index.dart' as CheckBox;
import 'Radio/index.dart' as Radio;
import 'Slider/index.dart' as Slider;
import 'Switch/index.dart' as Switch;

List getWidgets() {
  List result = [];
  result.addAll(Button.widgetPoints);
  result.addAll(Text.widgetPoints);
  result.addAll(Input.widgetPoints);
  result.addAll(CheckBox.widgetPoints);
  result.addAll(Radio.widgetPoints);
  result.addAll(Slider.widgetPoints);
  result.addAll(Switch.widgetPoints);
  return result;
}