import 'package:get/get.dart';
import 'state.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}