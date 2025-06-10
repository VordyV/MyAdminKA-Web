import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';

class MainPage extends GetView<MainController> {

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          Obx(()=>Text("${controller.count}")),
          FilledButton(onPressed: (){controller.increment();}, child: Text("Plus"))
        ],
      )),
    );
  }
}

