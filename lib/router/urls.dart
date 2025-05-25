import 'package:go_router/go_router.dart';
import '/views/views.dart';
import 'package:flutter/material.dart';

List<RouteBase> urls = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const MainView();
    },
  ),
  GoRoute(
    path: '/login',
    builder: (BuildContext context, GoRouterState state) {
      return const LoginView();
    },
  ),
];