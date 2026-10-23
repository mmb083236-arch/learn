import 'dart:convert';

import 'package:learn/feat/to_do_list/data/data/storage_Task_list.dart';
import 'package:learn/feat/to_do_list/data/module/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageTaskListControl {
  Future<void> save(List<Task> tasks) async {
    var data = [];

    for (var i = 0; i < tasks.length; i++) {
      data.add({
        "name": tasks[i].name,
        "dicription": tasks[i].dicription,
        "chak": tasks[i].chak,
      });
    }
    await StorageTaskList().save(jsonEncode(data));
  }

  Future<List<Task>?> get() async {
    final storage = await SharedPreferences.getInstance();

    List<dynamic>? loadedData;
    List<Task> data = [];
    try {
      loadedData = jsonDecode(await storage.getString("List")!);
      for (var i = 0; i < loadedData!.length; i++) {
        data.add(
          Task(
            name: loadedData[i]["name"],
            dicription: loadedData[i]["dicription"],
            chak: loadedData[i]["chak"],
          ),
        );
      }
    } catch (e) {
      loadedData = [];
      print(e);
    }

    return data;
  }
}
