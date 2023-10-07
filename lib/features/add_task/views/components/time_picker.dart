part of add_task;

class TimePicker extends StatelessWidget {
  TimePicker({super.key});

  final controller = Get.find<AddTaskController>();
  final now = TimeOfDay.now();

  Future showTime(context) async {
    var time = await showTimePicker(
      context: context,
      initialTime: now,
    );
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var time = await showTime(context);
        if (time != null) {
          controller.date.value = TimeUtil.toDate(controller.date.value, time);
        }
      },
      child: SizedBox(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: ShapeDecoration(
                color: Colors.red.withOpacity(.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Icon(
                Icons.access_time,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 10),
            Obx(
              () => Expanded(
                child: TextCustom(
                  text: TimeUtil.toJM(controller.date.value),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
