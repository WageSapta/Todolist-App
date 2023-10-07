library add_category;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/features/add_category/views/screens/add_tasks_in_category.dart';
import 'package:todolist/shared_components/text_custom.dart';
import 'package:todolist/utilities/helpers/extensions.dart';

import '../../../../shared_components/create_button.dart';
import '../../../../shared_components/form_field.dart';
import '../../../../utilities/helpers/helpers.dart';
import '../../controllers/add_category_controller.dart';

part '../components/button_add_tasks.dart';
part '../components/selected_tasks.dart';

class AddCategoryPage extends GetView<AddCategoryController> {
  const AddCategoryPage({super.key});

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
                    text: controller.arguments.value != null
                        ? "Edit\nCategory"
                        : "Create\nNew Category",
                    fontWeight: FontWeight.bold,
                    fontSize: Get.width * .1,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: AddFormField(
                      controller: controller.titleController,
                      hint: "Category Name",
                    ),
                  ),
                  SelectedTasks(),
                ].separated(20).addLastHeight(30),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: CreateButton(
                text: controller.arguments.value != null
                    ? "SAVE CATEGORY"
                    : "CREATE CATEGORY",
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    await controller.createEditCategory();
                    Get.back();
                    Helpers.snackbar(
                      controller.arguments.value != null
                          ? "Category Saved"
                          : "Category Created",
                    );
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
