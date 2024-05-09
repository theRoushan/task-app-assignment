import 'dart:convert';
import 'dart:developer';

import 'package:etask/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  //get Task from shared pref
  Future<List<Task>> getTasks() async {
    List<Task> tasks = [];
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString('task_storage');
      if (data != null) {
        final List<dynamic> tasksJson = json.decode(data);
        tasks = tasksJson.map((task) => Task.fromJson(task)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return tasks;
  }

  //save Task to shared pref
  Future<void> saveTasks(List<Task> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = json.encode(tasks);
      await prefs.setString('task_storage', data);
    } catch (e) {
      log(e.toString());
    }
  }
}
