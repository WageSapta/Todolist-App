library categories;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/config/colors/app_colors.dart';

import '../../controllers/category_controller.dart';
part '../components/app_bar_form_field.dart';

class CategoriesPage extends GetView<CategoryController> {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          AppBarFormField(
            onChanged: (e) => controller.search(e),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      child: const Placeholder()),
                  title: Text(
                    'Place ${index + 1}',
                    textScaleFactor: 2,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
