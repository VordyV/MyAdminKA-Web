import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';
import 'package:myadminka_web/widgets/widgets.dart' as widgets;

class RegisterPage extends GetView<RegisterController> {

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widgets.PrimaryForm(
        title: "Registration",
        body: [
          widgets.PrimaryTextField(label: Text("Name"), maxLength: 32, autofocus: true),
          widgets.PrimaryTextField(label: Text("Email"), maxLength: 32, autofocus: true),
          const SizedBox(height: 15),
          const Divider(),
          widgets.PrimaryTextField(label: Text("Password"), isPassword: true),
          widgets.PrimaryTextField(label: Text("Re password"), isPassword: true),
        ],
        actions: [
          TextButton(onPressed: () => controller.goLoginPage(), child: Text("Log in")),
          const SizedBox(width: 5),
          FilledButton(onPressed: (){}, child: Text("Sign up"))
        ],
      ),
    );
  }

}