import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'state.dart';
import 'widgets.dart';

class LoginPage extends GetView<LoginController> {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicHeight(
          //width: 350,
          //height: 335,
          child: Card(
            child: Container(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("Authorization", style: TextTheme.of(context).titleLarge),
                    ),
                    const Divider(),
                    CTextField(label: Text("Name"), maxLength: 32, autofocus: true),
                    CTextField(label: Text("Password"), isPassword: true),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Obx(()=>Visibility(
                        visible: controller.isVisibleError.value,
                        child: Row(
                          children: [Icon(Icons.warning, color: Theme.of(context).primaryColor), SelectableText("...", style: TextStyle(color: Theme.of(context).primaryColor))],
                        ),
                      )),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){}, child: Text("Sign up")),
                          const SizedBox(width: 5),
                          FilledButton(onPressed: (){}, child: Text("Log in"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}