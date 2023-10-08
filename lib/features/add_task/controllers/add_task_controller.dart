import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/core.dart';

class AddTaskController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  var listCategory = DbService.boxCategories.values;
  var date = DateTime.now().obs;
  var selectedCategory = Rx<CategoryModel?>(null);

  Future<void> createTask() async {
    var model = TaskModel(
      id: DbService.boxTasks.length + 1,
      idCategory: selectedCategory.value?.id,
      title: titleController.text,
      description: descriptionController.text,
      dateCreated: DateTime.now(),
      dateDestination: date.value,
      isCompleted: false,
      dateAddTask:selectedCategory.value?.id !=null? DateTime.now():null,

    );
    Get.log(model.toString());
    await DbService.putTask(model.id, model);
  }
}
