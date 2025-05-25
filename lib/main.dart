import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:dio/dio.dart';
import 'services/services.dart';
import 'models/user_model.dart';
import 'package:get/get.dart';
import 'logger.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  usePathUrlStrategy();

  Logger.debugMode = true;
  Logger.level = 0;

  Dio client = Dio();
  client.options.baseUrl = dotenv.env['API_SERVER_ADDRESS']!;

  final SharedPreferencesAsync prefs = SharedPreferencesAsync();

  AuthService as = AuthService(client: client);

  User user = User(config: prefs, authService: as);
  Get.put(user);
  client.interceptors.add(user.interceptor);

  Logger.info("Begin");

  try{
    await user.resumeSession();
  } catch (e){
    debugPrint(e.toString());
  }


  runApp(const App());
}