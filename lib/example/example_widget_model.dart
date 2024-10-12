import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  Future<Box<User>>? userBox;
  void setUp() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    userBox = Hive.openBox<User>('user_box');
    userBox?.then(
      (box) {
        box.listenable().addListener(() {
          print(box.length);
        });
      },
    );
  }

  void doSome() async {
    final box = await userBox;
    final user = User('Ivan', 20, null);
    await box?.add(user);
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
