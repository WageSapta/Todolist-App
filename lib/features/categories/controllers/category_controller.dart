import 'package:get/get.dart';

class CategoryController extends GetxController {
  final searchContoller=TextEditingController();
  void search() {
    if (searchContoller.text.isEmpty) {
      Get.log('KOSONG');
    }else{
      
    }
  }
}
