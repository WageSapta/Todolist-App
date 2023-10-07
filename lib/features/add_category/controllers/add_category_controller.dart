import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/core.dart';

class AddCategoryController extends GetxController {
  final boxTasks = DbService.boxTasks;
  final boxCategories = DbService.boxCategories;
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final searchController = TextEditingController();
  var tasks = <TaskModel>[].obs;
  var selectedTasks = <TaskModel>[].obs;
  var removedTasks = <TaskModel>[].obs;
  var arguments = Rx<CategoryModel?>(null);
  final _currentDate = DateTime.now();

  List<TaskModel> showHasCategoryInBottom(Iterable<TaskModel> data) {
    List<TaskModel> notHaveCategoryAndMyTasks = [];
    List<TaskModel> myTasks = [];
    List<TaskModel> notMyTasks = [];
    List<TaskModel> result = [];
    var notHaveCategory = data.where((e) => e.idCategory == null).toList();
    if (arguments.value != null) {
      notMyTasks = data
          .where((e) =>
              e.idCategory != null && e.idCategory != arguments.value!.id)
          .toList();
      myTasks = data
          .where((e) =>
              e.idCategory != null && e.idCategory == arguments.value!.id)
          .toList();
      notHaveCategoryAndMyTasks = [...notHaveCategory, ...myTasks];
      notHaveCategoryAndMyTasks
          .sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
      result = [...notHaveCategoryAndMyTasks, ...notMyTasks];
    } else {
      var haveCategory = data.where((e) => e.idCategory != null).toList();
      result = [...notHaveCategory, ...haveCategory];
    }
    return result;
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.clear();
  }

  init() async {
    if (Get.arguments != null) {
      var data = Get.arguments as CategoryModel;
      arguments.value = data;
      titleController.text = arguments.value!.title;
      await initSelectedTasks(data.id);
    }
    initTasks();
  }

  initSelectedTasks(int id) async {
    var tasksById = boxTasks.values.where((e) => e.idCategory == id).toList();
    tasksById.sort((a, b) => a.dateAddTask!.compareTo(b.dateAddTask!));
    selectedTasks.assignAll(tasksById);
  }

  void initTasks() {
    var tasksById = boxTasks.values;
    var data = showHasCategoryInBottom(tasksById);
    tasks.assignAll(data);
  }

  void search() {
    var searchText = searchController.text.toLowerCase();
    var result = <TaskModel>[];
    for (var e in boxTasks.values) {
      var titleTask = e.title.toLowerCase().contains(searchText);
      var descriptionTask = e.description.toLowerCase().contains(searchText);
      if (e.idCategory != null) {
        var category = boxCategories.get(e.idCategory);
        var titleCategory = category!.title.toLowerCase().contains(searchText);
        if (arguments.value != null && arguments.value!.id == e.idCategory) {
          if (titleTask || descriptionTask) {
            result.add(e);
          }
        } else {
          if (titleTask || titleCategory) {
            result.add(e);
          }
        }
      } else {
        if (titleTask || descriptionTask) {
          result.add(e);
        }
      }
    }
    var data = showHasCategoryInBottom(result);
    tasks.assignAll(data);
  }

  void selectTask(TaskModel task) {
    bool checkNull = arguments.value != null && task.idCategory != null;
    if (selectedTasks.contains(task)) {
      selectedTasks.remove(task);
      if (checkNull && arguments.value!.id == task.idCategory) {
        removedTasks.add(task);
      }
    } else {
      selectedTasks.add(task);
      removedTasks.remove(task);
    }
  }

  void deleteSelected(TaskModel task) {
    bool checkNull = arguments.value != null && task.idCategory != null;
    selectedTasks.remove(task);
    if (checkNull && arguments.value!.id == task.idCategory) {
      removedTasks.add(task);
    }
  }

  Future<void> createEditCategory() async {
    int i = 0;
    CategoryModel? categoryModel;
    if (arguments.value != null) {
      categoryModel = CategoryModel(
        id: arguments.value!.id,
        title: titleController.text,
        color: arguments.value!.color,
      );
    } else {
      categoryModel = CategoryModel(
        id: DbService.boxCategories.length + 1,
        title: titleController.text,
        color: AppColors.randomColor().value,
      );

      await DbService.putCategory(categoryModel.id, categoryModel);
    }
    if (selectedTasks.isNotEmpty) {
      for (var e in selectedTasks) {
        var task = e
          ..idCategory = categoryModel.id
          ..dateAddTask = _currentDate
              .subtract(Duration(seconds: selectedTasks.length - i));
        i++;
        await DbService.putTask(task.id, task);
      }
    }
    if (removedTasks.isNotEmpty) {
      for (var e in removedTasks) {
        var task = e
          ..idCategory = null
          ..dateAddTask = null;
        await DbService.putTask(task.id, task);
      }
    }
  }
}
