import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }

    var box = await Hive.openBox<User>('testBox');
    // final index = await box.add(User('Daniel', 1000, 'Zib'));
    // final user = await box.getAt(index);
    // print(user);
    // print(box.keys);
    // print(box.values);

    final user = box.get('Ivan');
    await user?.delete();
    print(box.get('Ivan'));
    box.close();
  }
}

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  User(this.name, this.age);
  @override
  String toString() => 'Name: $name Age: $age';
}

@HiveType(typeId: 0)
class Pat extends HiveObject {
  @HiveField(0)
  String name;
  Pat(this.name);
  @override
  String toString() => 'Name: $name';
}
