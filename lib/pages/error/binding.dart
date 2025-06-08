import 'package:get/get.dart';
import 'state.dart';

class ErrorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ErrorController>(ErrorController(errorMessage: "Page not found"));
  }
}