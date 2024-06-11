import 'package:get_storage/get_storage.dart';

class CustomLocalStorage {
  static final CustomLocalStorage _instance = CustomLocalStorage._internal();
  factory CustomLocalStorage() => _instance;

  CustomLocalStorage._internal();

  final _storage = GetStorage();

  Future<dynamic> readData(String key) async {
    return _storage.read(key);
  }

  Future<void> writeData(String key, dynamic value) async {
    await _storage.write(key, value);
  }
}
