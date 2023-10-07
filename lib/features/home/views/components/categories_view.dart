part of home_page;

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextCustom(
                text: "Categories",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              IconButton(
                onPressed: () => Get.toNamed(AppPages.categories),
                icon: const Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          width: Get.width,
          child: LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxHeight / 1.2;
              return ValueListenableBuilder(
                valueListenable: controller.listenCategories,
                builder: (_, category, widget) {
                  return ListView.separated(
                    itemCount: category.values.length + 1,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemBuilder: (ctx, index) {
                      if (index >= category.values.length) {
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: GestureDetector(
                            onTap: () => Get.toNamed(AppPages.addCategory),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              dashPattern: const [5, 10],
                              strokeCap: StrokeCap.round,
                              radius: const Radius.circular(20),
                              child: SizedBox(
                                width: width,
                                child: const Center(
                                  child: Icon(
                                    Icons.add_rounded,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      var data = category.getAt(index)!;
                      return ValueListenableBuilder(
                        valueListenable: controller.listenTasks,
                        builder: (_, task, widget) {
                          var tasksCategory =
                              task.values.where((e) => e.idCategory == data.id);
                          var totalCompleted =
                              tasksCategory.where((e) => e.isCompleted == true);
                          return CardCategory(
                            onTap: () => Get.toNamed(
                              AppPages.addCategory,
                              arguments: data,
                            ),
                            width: width,
                            data: data,
                            total: tasksCategory.length,
                            totalCompleted: totalCompleted.length,
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
