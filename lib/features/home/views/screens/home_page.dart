library home_page;

import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:todolist/core.dart';
import 'package:todolist/shared_components/my_dialog.dart';
import 'package:todolist/shared_components/empty_image.dart';
import 'package:todolist/utilities/helpers/extensions.dart';
import 'package:todolist/utilities/utils/time_util.dart';

import '../../../../shared_components/check_box_tile.dart';
import '../../../../shared_components/text_custom.dart';
import '../../../../utilities/helpers/helpers.dart';
import '../../controllers/home_controller.dart';

part '../components/title_home.dart';
part '../components/top_view.dart';
part '../components/categories_view.dart';
part '../components/category_card.dart';
part '../components/tasks_view.dart';
part '../components/mark_category.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.isScrollMax.isFalse,
          child: FloatingActionButton.extended(
            icon: const Icon(Icons.add),
            shape: const StadiumBorder(),
            label: const Text("New Task"),
            onPressed: () => Get.toNamed(AppPages.addTask),
          ).animate().fade(duration: 200.ms),
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: TitleHome(),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: const Column(
          children: [
            TopView(),
            SizedBox(height: 10),
            CategoriesView(),
            SizedBox(height: 10),
            TasksView(),
          ],
        ),
      ),
    );
  }
}
