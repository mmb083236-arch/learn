import 'package:shared_preferences/shared_preferences.dart';

class StorageTaskList {
  Future<void> save(String value) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString('List', value);
  }

  Future<String?> get() async {
    final storage = await SharedPreferences.getInstance();
    print(storage.getString('List'));
    return  storage.getString('List');
  }
}