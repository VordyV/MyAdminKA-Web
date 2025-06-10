import 'package:get/get.dart';
import 'package:myadminka_web/settings.dart' as settings;

class LoginController extends GetxController{
  var isVisibleError = false.obs;

  void goRegPage() {
    Get.offNamed(settings.Urls.registration);
  }
}