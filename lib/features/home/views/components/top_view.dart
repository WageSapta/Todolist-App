part of home_page;

class TopView extends StatefulWidget {
  const TopView({Key? key}) : super(key: key);

  @override
  State<TopView> createState() => _TopViewState();
}

class _TopViewState extends State<TopView> {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        DbService.boxTasks.values.forEach((e) { 
          if(e.idCategory != null){
          // print(DateTime.now().difference(e.dateCompleted!).inDays);
          print(e.title);

          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: ValueListenableBuilder(
              valueListenable: controller.listenTasks,
              builder: (_, box, widget) {
                var values = box.values;
                int countCreated = values.length;
                int countCompleted =
                    values.where((e) => e.isCompleted == true).length;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustom(
                            text: countCreated.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          const SizedBox(height: 5),
                          const TextCustom(
                            text: "Created tasks",
                            color: Colors.white70,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextCustom(
                            text: countCompleted.toString(),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          const SizedBox(height: 5),
                          const TextCustom(
                            text: "Completed tasks",
                            color: Colors.white70,
                            maxLines: 2,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
