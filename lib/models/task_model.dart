import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int? idCategory;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  DateTime dateCreated;
  @HiveField(5, defaultValue: false)
  bool? isCompleted;
  @HiveField(6)
  DateTime? dateCompleted;
  @HiveField(7)
  DateTime dateDestination;
  @HiveField(8)
  DateTime? dateAddTask;

  TaskModel({
    required this.id,
    this.idCategory,
    required this.title,
    required this.description,
    required this.dateCreated,
    this.isCompleted,
    this.dateCompleted,
    required this.dateDestination,
    this.dateAddTask,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.id == id &&
        other.idCategory == idCategory &&
        other.title == title &&
        other.description == description &&
        other.dateCreated == dateCreated &&
        other.isCompleted == isCompleted &&
        other.dateCompleted == dateCompleted &&
        other.dateDestination == dateDestination &&
        other.dateAddTask == dateAddTask;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idCategory.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dateCreated.hashCode ^
        isCompleted.hashCode ^
        dateCompleted.hashCode ^
        dateDestination.hashCode ^
        dateAddTask.hashCode;
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, idCategory: $idCategory, title: $title, description: $description, dateCreated: $dateCreated, isCompleted: $isCompleted, dateCompleted: $dateCompleted, dateDestination: $dateDestination, dateAddTask: $dateAddTask)';
  }
}
