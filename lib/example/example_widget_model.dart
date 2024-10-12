import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  void doSome() async {
    const secureStorage = FlutterSecureStorage();
    final containsEncriptionKey = await secureStorage.containsKey(key: 'key');

    if (!containsEncriptionKey) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }

    final key = await secureStorage.read(key: 'key');
    final encryptionKey = base64Url.decode(key!);

    var encreptedBox = await Hive.openBox<String>(
      'vaultBox',
      encryptionCipher: HiveAesCipher(encryptionKey),
    );
    await encreptedBox.put('secret', 'Hive is cool');
    print(encreptedBox.get('secret'));
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
