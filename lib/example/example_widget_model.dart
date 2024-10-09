import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class ExampleWidgetModel {
  ExampleWidgetModel(){
    Hive.initFlutter();
  }
  void doSome() async{
    var box = await Hive.openBox('test Box');
    final name = box.get('name') as String?;
    print(name);
  }
}