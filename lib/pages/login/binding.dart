import 'package:get/get.dart';
import 'state.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}