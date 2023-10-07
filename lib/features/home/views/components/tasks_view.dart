part of home_page;

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => TasksViewState();
}

class TasksViewState extends State<TasksView> {
  final controller = Get.find<HomeController>();
  final currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextCustom(
                  text: "Tasks",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                IconButton(
                  onPressed: () => Get.toNamed(AppPages.tasks),
                  icon: const Icon(Icons.arrow_forward_rounded),
                ),
              ],
            ),
            StreamBuilder<DateTime>(
                stream: controller.titleDate.stream,
                builder: (context, snapshot) {
                  return ValueListenableBuilder(
                    valueListenable: controller.listenTasks,
                    builder: (context, box, widget) {
                      if (box.isEmpty) {
                        return const EmptyImage();
                      }
                      return Column(
                        children: [
                          Visibility(
                            visible: box.isNotEmpty,
                            child: const SizedBox(height: 10),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: box.length,
                            separatorBuilder: (_, i) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              var items = controller.sortingTasks(
                                  box.values.toList(),
                                  snapshot.data ?? currentDate);
                              var data = items[index];

                              var date =
                                  DateUtil.fullNumber(data.dateDestination);
                              var time = TimeUtil.toJM(data.dateDestination);
                              return GestureDetector(
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return MyDialog(
                                        content:
                                            "Do you want delete task ${data.title}?",
                                        buttonColor: Colors.red[700]!,
                                        onPressed: () async {
                                          await controller.deleteTask(data.id);
                                          Get.back();
                                          Helpers.snackbar("Task Deleted");
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Stack(
                                  children: [
                                    CheckBoxTile(
                                      valueKey: ValueKey(data.hashCode),
                                      value: data.isCompleted,
                                      onChanged: (val) async {
                                        await controller.updateIsCompleted(
                                          data.id,
                                          val!,
                                        );
                                      },
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: TextCustom(
                                              text: data.title,
                                              overflow: TextOverflow.fade,
                                              fontWeight: data.isCompleted!
                                                  ? FontWeight.normal
                                                  : FontWeight.bold,
                                              textDecoration: data.isCompleted!
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          TextCustom(
                                            text: data.dateDestination.isToday
                                                ? time
                                                : date,
                                            fontSize: 10,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      subtitle: data.isCompleted!
                                          ? null
                                          : Row(
                                              children: [
                                                Expanded(
                                                  child: TextCustom(
                                                    text: data.description,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: !data
                                                      .dateDestination.isToday,
                                                  child: Row(
                                                    children: [
                                                      const SizedBox(width: 10),
                                                      if (controller
                                                          .titleDate.value
                                                          .isAfter(data
                                                              .dateDestination))
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 1,
                                                            horizontal: 6,
                                                          ),
                                                          decoration:
                                                              ShapeDecoration(
                                                            color:
                                                                Colors.red[700],
                                                            shape:
                                                                const StadiumBorder(),
                                                          ),
                                                          child: const Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              TextCustom(
                                                                text: "late",
                                                                fontSize: 10,
                                                                color: AppColors
                                                                    .white,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      else
                                                        TextCustom(
                                                          text: time,
                                                          fontSize: 10,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      top: 10,
                                      child: MarkCategory(
                                        idCategory: data.idCategory,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            // TasksCompleted(),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
