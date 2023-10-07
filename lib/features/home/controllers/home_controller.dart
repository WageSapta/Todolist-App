import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/core.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final scrollController = ScrollController();
  var isScrollMax = false.obs;
  var listenTasks = DbService.boxTasks.listenable();
  var listenCategories = DbService.boxCategories.listenable();
  var titleDate = DateTime.now().obs;
  Timer? _timer;

  @override
  void onInit() {
    listenScroll();
    realtimeDate();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    _timer?.cancel();
  }

  

  List<TaskModel> sortingTasks(List<TaskModel> values,DateTime titleDate) {
    var trueValues = values
        .where((e) =>
            e.isCompleted! &&
            titleDate.difference(e.dateCompleted!).inDays <= 1)
        .toList();
    trueValues.sort((a, b) => b.dateCompleted!.compareTo(a.dateCompleted!));
    var falseValues = values.where((e) => !e.isCompleted!).toList();
    falseValues.sort((a, b) => b.dateCreated.compareTo(a.dateCreated));
    var items = [...falseValues, ...trueValues].toList();
    return items;
  }

  void realtimeDate() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      titleDate.value = DateTime.now();
    });
  }

  void listenScroll() {
    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double pixels = scrollController.position.pixels;
      if (maxScroll == pixels && maxScroll != 0.0 && isScrollMax.isFalse) {
        isScrollMax.value = true;
      } else if ((maxScroll == 0.0 && pixels == 0.0) || isScrollMax.isTrue) {
        isScrollMax.value = false;
      }
    });
  }

  Future<void> updateIsCompleted(int id, bool val) async {
    var task = listenTasks.value.get(id);
    task!.isCompleted = !task.isCompleted!;
    task.dateCompleted = DateTime.now();
    await DbService.putTask(id, task);
  }

  Future<void> deleteTask(int id) async {
    await DbService.deleteTask(id);
  }
}
