part of home_page;

class TitleHome extends StatelessWidget {
  TitleHome({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextCustom(
          text: DateUtil.day(controller.titleDate.value),
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
        const Text(" ,"),
        TextCustom(
          text: DateUtil.monthYear(controller.titleDate.value),
          fontSize: 23,
        ),
      ],
    );
  }
}
