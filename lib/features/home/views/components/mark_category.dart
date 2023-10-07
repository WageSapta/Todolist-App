part of home_page;

class MarkCategory extends StatelessWidget {
  MarkCategory({
    super.key,
    required this.idCategory,
  });

  final int? idCategory;
  final controller = Get.find<HomeController>();
  CategoryModel? data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (idCategory != null) {
          data = controller.listenCategories.value.get(idCategory);
        }
        return Container(
          height: 30,
          width: 10,
          decoration: BoxDecoration(
            color: idCategory == null ? Colors.grey : Color(data!.color),
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(10),
            ),
          ),
        );
      },
    );
  }
}
