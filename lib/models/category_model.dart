import 'package:hive_flutter/hive_flutter.dart';

part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(4)
  int color;

  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryModel &&
        other.id == id &&
        other.title == title &&
        other.color == color;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ color.hashCode;

  @override
  String toString() => 'CategoryModel(id: $id, title: $title, color: $color)';
}
