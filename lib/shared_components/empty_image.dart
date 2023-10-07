import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todolist/config/assets/app_assets.dart';
import 'package:todolist/shared_components/text_custom.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    super.key,
    this.center = false,
    this.isImage = true,
    this.text = "Not Found",
  });
  final bool center;
  final bool isImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (center) {
      return SizedBox(
        height: Get.height - kToolbarHeight - kToolbarHeight,
        width: Get.width,
        child: isImage
            ? Image.asset(
                AppAssets.empty,
                scale: 7,
              )
            : Center(
                child: TextCustom(
                  text: text,
                  fontWeight: FontWeight.bold,
                ),
              ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(top: Get.height * .1),
      child: isImage
          ? Image.asset(
              AppAssets.empty,
              scale: 7,
            )
          : TextCustom(
              text: text,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
