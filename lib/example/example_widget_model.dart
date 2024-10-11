import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PetAdapter());
    }

    var box = await Hive.openBox<User>('testBox');
    var petBox = await Hive.openBox<Pet>('petBox');

    // final pet = Pet('Alex');
    // await petBox.add(pet);
    // final pets = HiveList(petBox, objects: [pet]);
    // final user = User('Ivan', 54, pets);
    // await box.put('user',user);
    // print(box.values);

    final user = box.get('user');

    print(user);

    box.close();
    petBox.close();
  }
}

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(3)
  HiveList<Pet>? pets;
  User(this.name, this.age, this.pets);
  @override
  String toString() => 'Name: $name Age: $age Pets: ${pets?.toList()}';
}

@HiveType(typeId: 1)
class Pet extends HiveObject {
  @HiveField(0)
  String name;
  Pet(this.name);
  @override
  String toString() => 'Name: $name';
}
