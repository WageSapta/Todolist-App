part of home_page;

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    required this.width,
    required this.data,
    required this.totalCompleted,
    required this.total,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final CategoryModel data;
  final int totalCompleted;
  final int total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        decoration: BoxDecoration(
          color: Color(data.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextCustom(
                text: data.title,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade,
                fontSize: 18,
                maxLines: 5,
              ),
            ),
            if (totalCompleted == total && total > 0)
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  decoration: ShapeDecoration(
                    color: Colors.grey.shade900,
                    shape: const StadiumBorder(),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextCustom(
                        text: "Completed",
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
              )
            else
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: TextCustom(
                  text: "Completed  $totalCompleted of $total",
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
