import 'dart:async';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/services/auth_service.dart';
import 'package:dio/dio.dart';
import '/router/navigator.dart';
import '/logger.dart';

class UserResumeSessionException implements Exception {}

enum UserStatuses {
  unAuthorized,
  authorized;
}

class UserInfo {
   String name = "";
   String email = "";
   String dateTimeCreate = "";
   String hashDateTimeUpdate = "";
}

class User {

  final SharedPreferencesAsync config;
  final AuthService authService;
  late final Interceptor interceptor;
  String _accessToken = "";
  UserStatuses status = UserStatuses.unAuthorized;
  UserInfo info = UserInfo();
  Timer? _timer;

  User({required this.config, required this.authService})  {
   interceptor = InterceptorsWrapper(
     onError: onInterceptorError
   );
  }

  onInterceptorError(DioException error, ErrorInterceptorHandler handler) async {
    if (status == UserStatuses.authorized) {
      switch (error.response!.statusCode) {
        case 422: {
          Map<String, dynamic> data = error.response?.data;
          if (data["error_type"] == "JWTDecodeError") {
            await logout();
            navigatorKey.currentContext!.go("/login");
          }
          break;
        }
      }
    }

    print(error.requestOptions.data.toString());
    print("interceptor user. go /login");

    return handler.next(error);
  }

  Future<void> _authorize(String accessToken, {String? refreshToken}) async {
    _accessToken = accessToken;
    if (refreshToken != null) {
      await config.setString('token', refreshToken);
    }
    status = UserStatuses.authorized;
    _startNewAccessUpdateTimer();
  }

  Future<bool> login(String name, String password) async {
    Logger.debug("login; name = $name");
    Map<String, dynamic> tokens = await authService.login(name, password);
    _accessToken = tokens['access_token'];
    await _authorize(tokens['access_token'], refreshToken: tokens['refresh_token']);
    await update();
    return true;
  }

  void _startNewAccessUpdateTimer() async {
    Logger.debug("_startNewAccessUpdateTimer;");
    JWT jwt = JWT.decode(_accessToken);

    double expTime = jwt.payload['exp'];
    double currentTime = DateTime.now().millisecondsSinceEpoch / 1000;
    double remainingTime = expTime - currentTime - 15.0;
    Logger.debug("\tremainingTime = ${remainingTime.toInt()}");
    _timer = Timer(Duration(seconds: remainingTime.toInt()), _onUpdateAccessToken);
  }

  void _onUpdateAccessToken() async {
    Logger.debug("_onUpdateAccessToken;");
    await _refresh();
  }

  Future<bool> resumeSession() async {
    Logger.debug("resumeSession;");
    await _refresh();
    await update();
    return true;
  }

  Future<bool> _refresh() async {
    Logger.debug("_refresh;");
    String? token = await config.getString('token');
    if (token == null) {
      throw UserResumeSessionException();
    }
    Map<String, dynamic> tokens = await authService.refresh(token);
    await _authorize(tokens['access_token']);
    return true;
  }

  Future<bool> logout () async {
    Logger.debug("logout;");
    _timer?.cancel();
    await config.remove("token");
    status = UserStatuses.unAuthorized;
    return true;
  }
  Future<bool> update() async {
    Logger.debug("update;");
    Map<String, dynamic> data = await authService.info(_accessToken);
    info.name = data['name'] ?? "null";
    info.email = data['email'] ?? "null";
    info.dateTimeCreate = data['datetime_create'] ?? "null";
    info.hashDateTimeUpdate = data['hash_datetime_update'] ?? "null";
    Logger.debug("\t${data.toString()}");
    return true;
  }

}