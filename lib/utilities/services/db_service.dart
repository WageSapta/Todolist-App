import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as path;
import 'package:todolist/core.dart';

class DbService extends GetxService {
  DbService._();
  static final DbService _instance = DbService._();
  factory DbService() => _instance;

  static late Box<TaskModel> boxTasks;
  static late Box<CategoryModel> boxCategories;

  Future<DbService> init() async {
    var dir = await path.getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    await Hive.openBox<TaskModel>("tasks");
    await Hive.openBox<CategoryModel>("categories");
    boxTasks = Hive.box("tasks");
    boxCategories = Hive.box("categories");
    // boxTasks.clear();
    // boxCategories.clear();
    return this;
  }

  static Future<void> putTask(int id, TaskModel task) async {
    try {
      await boxTasks.put(id, task);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  static Future<void> deleteTask(int id) async {
    try {
      await boxTasks.delete(id);
    } catch (e) {
      Get.log(e.toString());
    }
  }

  static Future<void> putCategory(int id, CategoryModel category) async {
    try {
      await boxCategories.put(id, category);
    } catch (e) {
      Get.log(e.toString());
    }
  }
}
