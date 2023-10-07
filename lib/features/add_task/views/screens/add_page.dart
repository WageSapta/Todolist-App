library add_task;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:todolist/core.dart';
import 'package:todolist/utilities/helpers/extensions.dart';
import 'package:todolist/utilities/helpers/helpers.dart';
import 'package:todolist/utilities/utils/time_util.dart';

import '../../../../shared_components/create_button.dart';
import '../../../../shared_components/form_field.dart';
import '../../../../shared_components/text_custom.dart';
import '../../controllers/add_task_controller.dart';

part '../components/date_picker.dart';
part '../components/time_picker.dart';
part '../components/category_picker.dart';

class AddTaskPage extends GetView<AddTaskController> {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: ListView(
                children: [
                  TextCustom(
                    text: "Create\nNew Task",
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * .1,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        AddFormField(
                          controller: controller.titleController,
                          hint: "Task Name",
                        ),
                        AddFormField(
                          controller: controller.descriptionController,
                          hint: "Description",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    child: SizedBox(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                DatePicker(),
                                const SizedBox(height: 10),
                                TimePicker(),
                              ],
                            ),
                          ),
                          const CategoryPicker()
                        ],
                      ),
                    ),
                  ),
                ].separated(10).addLastHeight(50),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: CreateButton(
                text: "CREATE TASK",
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    await controller.createTask();
                    Get.back();
                    Helpers.snackbar("Task Created");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
