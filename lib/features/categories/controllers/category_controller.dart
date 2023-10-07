import 'package:get/get.dart';

class CategoryController extends GetxController {
  void search(String e) {
    if (e.isEmpty) {
      Get.log('KOSONG');
    }
    Get.log(e);
  }
}
