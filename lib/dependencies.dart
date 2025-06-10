import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'services/services.dart';

class Repositories {

  static void setup() {
    // dependencies
    Get.putAsync<SharedPreferences>(() async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    }, permanent: true);
    Get.put<Dio>(Dio(), permanent: true);

    // services
    Get.put<AuthService>(AuthService(), permanent: true);
  }

}