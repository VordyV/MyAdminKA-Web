import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';
import '/router/router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  final User user = Get.find();

  void onClickLogout(BuildContext context) async {
    await user.logout();
    context.go("/login");
  }

  void onClickTestAccess(BuildContext context) async {
    try {
      await user.update();
    } catch (e){}
  }

  //FilledButton(onPressed: () => onClickLogout(context), child: Text("log out")),
  //FilledButton(onPressed: () => onClickTestAccess(context), child: Text("test access")),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CNavigationRail()
        ],
      ),
      appBar: CAppBar(),
    );
  }
}
