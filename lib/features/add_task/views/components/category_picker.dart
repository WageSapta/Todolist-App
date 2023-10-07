part of add_task;

class CategoryPicker extends StatefulWidget {
  const CategoryPicker({super.key});

  @override
  State<CategoryPicker> createState() => _CategoryPickerState();
}

class _CategoryPickerState extends State<CategoryPicker> {
  final controller = Get.find<AddTaskController>();

  var def = CategoryModel(
    id: -1,
    title: "Empty Category",
    color: Colors.white.value,
  );

  List<CategoryModel> get items {
    var data = controller.listCategory;
    var result = <CategoryModel>[];
    if (data.isNotEmpty) {
      result.addAll(data);
    } else {
      result.insert(0, def);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField2(
        onChanged: (e) {
          if (e != def) {
            controller.selectedCategory.value =
                controller.selectedCategory.value == e ? null : e;
          }
        },
        items: items.map((item) {
          return DropdownMenuItem<CategoryModel>(
            value: item,
            child: item.id == -1 && items.length == 1
                ? Center(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          );
        }).toList(),
        customButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: ShapeDecoration(
                color: Colors.blue.withOpacity(.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Icon(
                Icons.category,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
            Obx(() {
              return TextCustom(
                text: controller.selectedCategory.value == null
                    ? 'Category'
                    : controller.selectedCategory.value!.title,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black.withOpacity(.9),
              );
            }),
            const Spacer(),
            const Icon(Icons.arrow_drop_down_rounded)
          ],
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // Add more decoration..
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 2,
          maxHeight: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),

        
      ),
    );
  }
}
