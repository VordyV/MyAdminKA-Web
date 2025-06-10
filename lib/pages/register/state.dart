import 'package:get/get.dart';
import 'package:myadminka_web/settings.dart' as settings;

class RegisterController extends GetxController{
  void goLoginPage() {
    Get.offNamed(settings.Urls.authorization);
  }
}