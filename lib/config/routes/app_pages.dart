library app_pages;

import 'package:get/get.dart';

import '../../core_bindings_controllers.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes._initial;
  static const categories = AppRoutes._categories;
  static const tasks = AppRoutes._tasks;
  static const addTask = AppRoutes._addTask;
  static const addCategory = AppRoutes._addCategory;

  static List<GetPage> pages = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: categories,
      page: () => const CategoriesPage(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: tasks,
      page: () => const TasksPage(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: addTask,
      page: () => const AddTaskPage(),
      binding: AddTaskBinding(),
    ),
    GetPage(
      name: addCategory,
      page: () => const AddCategoryPage(),
      binding: AddCategoryBinding(),
    ),
  ];
}
