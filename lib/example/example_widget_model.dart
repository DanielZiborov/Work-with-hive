import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class ExampleWidgetModel {
  ExampleWidgetModel() {
    Hive.initFlutter();
  }
  void doSome() async {
    var box = await Hive.openBox('test Box');
    await box.put('name', 'Bill');
    await box.put('age', 21);
    final name = box.get('name') as String?;
    print(name);
    final age = box.get('age') as int?;
    print(age);
    await box.close();
  }
}
