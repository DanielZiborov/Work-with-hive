import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class ExampleWidgetModel {
  ExampleWidgetModel() {
    Hive.initFlutter();
  }
  void doSome() async {
    var box = await Hive.openBox('testBox');
    await box.deleteAt(0);
    print(box.keys);
    print(box.values);
    box.close();
  }
}
