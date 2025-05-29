import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'urls.dart';
import 'middleware.dart';
import 'navigator.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: middleware,
  routes: urls,
  navigatorKey: navigatorKey
);