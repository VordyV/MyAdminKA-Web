import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'views/views.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
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
  ],
);