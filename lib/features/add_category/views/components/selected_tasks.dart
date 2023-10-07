part of add_category;

class SelectedTasks extends StatelessWidget {
  SelectedTasks({super.key});
  final controller = Get.find<AddCategoryController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey[900],
                  backgroundColor: Colors.transparent,
                  side: BorderSide(
                    color: Colors.grey[900]!,
                  ),
                ),
                onPressed: () => Get.to(() => const AddTasksInCategory()),
                child: const TextCustom(text: "+ add tasks"),
              ),
            ),
            Obx(() {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: controller.selectedTasks.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, i) => const SizedBox(height: 5),
                itemBuilder: (context, index) {
                  var data = controller.selectedTasks[index];
                  return ListTile(
                    key: ValueKey(data.hashCode),
                    dense: true,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: TextCustom(
                      text: data.title,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: TextCustom(
                      text: data.description,
                      fontSize: 13,
                    ),
                    trailing: GestureDetector(
                      onTap: () => controller.deleteSelected(data),
                      child: const Icon(Icons.close),
                    ),
                  );
                },
              );
            })
          ].separated(10),
        ),
      ),
    );
  }
}
