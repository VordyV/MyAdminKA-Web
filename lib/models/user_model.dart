import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';

class UserResumeSessionException implements Exception {}

enum UserStatuses {
  unAuthorized,
  authorized
}

class User {

  final SharedPreferencesAsync config;
  final AuthService authService;
  String accessToken = "";
  UserStatuses status = UserStatuses.unAuthorized;

  User({required this.config, required this.authService});

  Future<void> resumeSession() async {
    String? token = await config.getString('token');
    if (token == null) {
      throw UserResumeSessionException();
    }

    Map<String, dynamic> tokens = await authService.refresh(token);

    await config.setString('token', tokens['refresh_token']);
    accessToken = tokens['access_token'];
    status = UserStatuses.authorized;
  }
}