part of add_task;

class DatePicker extends StatelessWidget {
  DatePicker({super.key});

  final controller = Get.find<AddTaskController>();

  Future showDate(context) async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var date = controller.date;
        var result = await showDate(context);
        if (result != null) {
          var time =
              TimeOfDay(hour: date.value.hour, minute: date.value.minute);
          controller.date.value = DateUtil.timeAsync(time, result);
        }
      },
      child: SizedBox(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: ShapeDecoration(
                color: Colors.amber.withOpacity(.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Icon(
                Icons.calendar_today_rounded,
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 10),
            Obx(
              () => Expanded(
                child: TextCustom(
                  text: DateUtil.full(controller.date.value),
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
