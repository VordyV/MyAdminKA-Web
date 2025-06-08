import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';
import 'widgets.dart';

class LoginPage extends GetView<LoginController> {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Login page")
    );
  }
}