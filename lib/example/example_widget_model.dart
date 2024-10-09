import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class ExampleWidgetModel {
  ExampleWidgetModel() {
    Hive.initFlutter();
  }
  void doSome() async {
    var box = await Hive.openBox('test Box');
    await box.put('friends', ['Bill', 'Alice', 'John']);
    final list = box.get('friends') as List<String>?;
    final index = await box.add(['Bill', 'Alice', 'John']);
    final values = box.getAt(index); 
    print(index);
    print(values);
    await box.close();
  }
}
