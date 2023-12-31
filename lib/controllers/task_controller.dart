import 'package:flutter_to_do_app/db/db_helper.dart';
import 'package:get/get.dart';

import '../models/task.dart';


class TaskController extends GetxController{

  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task})async{
    return await DBHelper.insert(task);
  }

  //get all data from database
   void getTasks() async{
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
   }
}