import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/utilities/helpers/extensions.dart';

class SearchSliverAppBar extends StatelessWidget {
  const SearchSliverAppBar({
    super.key,
    required this.onChanged,
    this.controller,
  });

  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leadingWidth: Get.width,
      // toolbarHeight: kToolbarHeight ,
      leading: Row(
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.keyboard_backspace,
              size: 30,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style:  TextStyle(
                fontSize: 15,
                color: Colors.grey[900],
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
                fillColor: Colors.grey[300],
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.only(right: 20),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
        ].separatedAll(5, isColumn: false),
      ),
    );
  }
}
