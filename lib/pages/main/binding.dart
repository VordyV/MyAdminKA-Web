import 'package:get/get.dart';
import 'state.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}