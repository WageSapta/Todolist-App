part of categories;

class AppBarFormField extends StatelessWidget {
  const AppBarFormField({
    super.key,
    this.onChanged,
  });

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      toolbarHeight: 65,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.keyboard_backspace),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(55, 10, 15, 10),
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            fillColor: Colors.grey[900],
            filled: true,
            isDense: true,
            hintText: 'Search',
            hintStyle: const TextStyle(color: AppColors.white, fontSize: 13),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade900,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: Colors.grey.shade900,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: Colors.grey.shade900,
              ),
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
