import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';
import 'widgets.dart';
import 'package:myadminka_web/widgets/widgets.dart' as widgets;

class LoginPage extends GetView<LoginController> {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgets.PrimaryForm(
          title: "Authorization",
          body: [
            CTextField(label: Text("Name"), maxLength: 32, autofocus: true),
            CTextField(label: Text("Password"), isPassword: true),
          ],
          actions: [
            TextButton(onPressed: () => controller.goRegPage(), child: Text("Sign up")),
            const SizedBox(width: 5),
            FilledButton(onPressed: (){}, child: Text("Log in"))
          ],
        ),
      )
    );
  }
}