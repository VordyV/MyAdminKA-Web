import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';

class ErrorPage extends GetView<ErrorController> {

  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Aaaaaaaaaaaaaaaaaaah! Error!\n${controller.errorMessage}")),
    );
  }
}