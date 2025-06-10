import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';
import 'dart:convert';

class ASUnpEntityException implements Exception {
  final Map<String, dynamic> detail;
  ASUnpEntityException({required this.detail});
}

class ASUnAuthException implements Exception {}
class ASInvalidTokenException implements Exception {}
class HTTPTooManyReqException implements Exception {}
class HTTPBadReqException implements Exception {}

class AuthService extends getx.GetxService{

  final Dio _client = getx.Get.find<Dio>();

  Future<Response> _request(String url, String method, {Map<String, dynamic>? data, Map<String, dynamic>? headers, String? accessToken}) async {
    try {
      if (accessToken != null) {
        headers = headers ?? {};
        headers["Authorization"] = "Bearer $accessToken";
      }
      Response response = await _client.request(url, options: Options(method: method, headers: headers), data: data);
      return response;
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 422: {
          Map<String, dynamic> data = e.response?.data;
          if (data["error_type"] == "JWTDecodeError") throw ASInvalidTokenException();
          throw ASUnpEntityException(detail: e.response?.data as Map<String, dynamic>);
        }
        case 401: throw ASUnAuthException();
        case 429: throw HTTPTooManyReqException();
        case 400: throw HTTPBadReqException();
        default: throw Exception(e.error.toString());
      }
    }
  }

  Future<Map<String, dynamic>> login(String name, String password) async {
    Response result = await _request("/api/auth/login", "POST", data: {"name": name, "password": password});
    return result.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> info(String accessToken) async {
    Response result = await _request("/api/auth/users/me", "GET", accessToken: accessToken);
    return result.data as Map<String, dynamic>;
  }

  Future<void> register(String name, String email, String password) async {
    await _request("/api/auth/register", "POST", data: {"name": name, "email": email, "password": password});
  }

  Future<void> delete(String accessToken) async {
    await _request("/api/auth/users/me", "DELETE", accessToken: accessToken);
  }

  Future<void> changeName(String accessToken, String name) async {
    await _request("/auth/users/me/changename", "POST", accessToken: accessToken, data: {"name": name});
  }

  Future<void> changeEmail(String accessToken, String email) async {
    await _request("/auth/users/me/changeemail", "POST", accessToken: accessToken, data: {"email": email});
  }

  Future<void> changePassword(String accessToken, String password, String newPassword) async {
    await _request("/auth/users/me/changepassword", "POST", accessToken: accessToken, data: {"password": password, "new_password": newPassword});
  }

  Future<Map<String, dynamic>> refresh(String refreshToken) async {
    Response response = await _request("/auth/refresh", "POST", data: {"refresh_token": refreshToken});
    return response.data as Map<String, dynamic>;
  }
}