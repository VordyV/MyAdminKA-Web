import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MyAdminKA web app",
      routerConfig: router
    );
  }
}
