import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:todolist/core.dart';
import 'package:todolist/features/add_category/controllers/add_category_controller.dart';
import 'package:todolist/shared_components/check_box_tile.dart';
import 'package:todolist/shared_components/empty_image.dart';
import 'package:todolist/shared_components/search_sliver_appbar.dart';
import 'package:todolist/utilities/helpers/extensions.dart';

import '../../../../shared_components/text_custom.dart';

class AddTasksInCategory extends StatefulWidget {
  const AddTasksInCategory({Key? key}) : super(key: key);

  @override
  State<AddTasksInCategory> createState() => _AddTasksInCategoryState();
}

class _AddTasksInCategoryState extends State<AddTasksInCategory> {
  final controller = Get.put<AddCategoryController>(AddCategoryController());

  @override
  void initState() {
    super.initState();
    controller.initTasks();
  }

  @override
  void dispose() {
    super.dispose();
    controller.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SearchSliverAppBar(
            controller: controller.searchController,
            onChanged: (e) => controller.search(),
          ),
          SliverToBoxAdapter(
            child: controller.tasks.isEmpty &&
                    controller.boxTasks.values.isEmpty
                ? const EmptyImage(center: true)
                : Obx(() {
                    if (controller.tasks.isEmpty &&
                        controller.boxTasks.values.isNotEmpty) {
                      return const EmptyImage(center: true, isImage: false);
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.tasks.length,
                      separatorBuilder: (_, i) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        var data = controller.tasks[index];
                        if ((controller.arguments.value == null &&
                                data.idCategory != null) ||
                            (controller.arguments.value != null &&
                                data.idCategory != null &&
                                data.idCategory !=
                                    controller.arguments.value!.id)) {
                          CategoryModel category =
                              controller.boxCategories.get(data.idCategory)!;
                          return ListTile(
                            key: ValueKey(data.hashCode),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            tileColor: Color(category.color),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextCustom(
                                  text: data.title,
                                  fontWeight: FontWeight.bold,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  decoration: ShapeDecoration(
                                    color: Colors.grey[900],
                                    shape: const StadiumBorder(),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextCustom(
                                        text: category.title.twoLetter(),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return Obx(() {
                          return CheckBoxTile(
                            valueKey: ValueKey(data.hashCode),
                            value: controller.selectedTasks.contains(data),
                            onChanged: (val) => controller.selectTask(data),
                            controlAffinity: ListTileControlAffinity.trailing,
                            title: TextCustom(
                              text: data.title,
                              fontWeight: FontWeight.bold,
                            ),
                            subtitle: TextCustom(
                              text: data.description,
                              fontSize: 13,
                            ),
                          );
                        });
                      },
                    );
                  }),
          )
        ],
      ),
    );
  }
}
