part of add_category;

class ButtonAddTasks extends StatelessWidget {
  const ButtonAddTasks({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: Colors.grey[900]!,
            ),
          ),
        ),
        child: Row(
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
                Icons.add_rounded,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
            const TextCustom(text: "Add Tasks"),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }
}
