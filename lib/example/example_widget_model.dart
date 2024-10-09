import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

class ExampleWidgetModel {
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    var box = await Hive.openBox<User>('testBox');
    final user = box.getAt(0);
    print(user);
    box.close();
  }
}

class User {
  String name;
  int age;
  User(this.name, this.age);
  @override
  String toString() => 'Name: $name Age: $age';
}

class UserAdapter extends TypeAdapter<User> {
  @override
  User read(BinaryReader reader) {
    final name = reader.readString();
    final age = reader.readInt();
    return User(name, age);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.age);
  }
}
