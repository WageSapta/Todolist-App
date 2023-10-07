import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/task_controller.dart';

class TasksPage extends GetView<TaskController> {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
