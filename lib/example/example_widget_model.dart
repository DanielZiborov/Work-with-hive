import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }

    var box = await Hive.openBox<User>('testBox');
    final index = await box.add(User('Daniel',1000));
    final user = await box.getAt(0);
    print(user);
    print(box.keys);
    print(box.values);
    box.close();
  }
}

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  User(this.name, this.age);
  @override
  String toString() => 'Name: $name Age: $age';
}
