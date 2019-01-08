import 'spacing/index.dart' as Spacing;
import 'Expanded/index.dart' as Expanded;

// import 'Axis/index.dart' as Axis;
import 'Table/index.dart' as Table;
import 'Align/index.dart' as Align;
import 'Layout/index.dart' as Layout;
import 'Stack/index.dart' as Stack;
import 'Box/index.dart' as Box;


List getWidgets() {
  List result = [];
  result.addAll(Spacing.widgetPoints);
  result.addAll(Expanded.widgetPoints);
  // result.addAll(Axis.widgetPoints);
  result.addAll(Table.widgetPoints);
  result.addAll(Align.widgetPoints);
  result.addAll(Layout.widgetPoints);
  result.addAll(Stack.widgetPoints);
  result.addAll(Box.widgetPoints);
  return result;
}
