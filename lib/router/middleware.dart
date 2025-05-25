import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import '/models/models.dart';
import '/logger.dart';

String? middleware (BuildContext context, GoRouterState state) {
  User user = Get.find();
  Logger.info("new path = ${state.fullPath}");
  if (user.status != UserStatuses.authorized) return "/login";
  if (user.status == UserStatuses.authorized && state.fullPath == "/login") return "/";
  return null;
}