import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class MyEvent {
  String text;
  MyEvent(this.text);
}
