import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/models.dart';
import 'package:go_router/go_router.dart';

class CAppBar extends StatefulWidget implements PreferredSizeWidget{
  const CAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2);
  @override
  State<CAppBar> createState() => _CAppBarState();
}

class _CAppBarState extends State<CAppBar> {

  final User user = Get.find();
  
  void onClickLogout(BuildContext context) {
    user.logout();
    context.go("/login");
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Text('AppBar Demo'),
      title: Row(
        children: [
          TextButton(onPressed: (){context.go("/");}, child: Text("Main")),
          TextButton(onPressed: (){}, child: Text("Admin"))
        ],
      ),
      actions: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(onPressed: (){context.go("/profile");}, child: Text(user.info.name)),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: () => onClickLogout(context), child: Text("Sing out")),
          ),
        )
      ],
    );
  }
}

