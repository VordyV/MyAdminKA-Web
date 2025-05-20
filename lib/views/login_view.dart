import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myadminka_web/services/services.dart';
import 'package:myadminka_web/models/models.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {

  const LoginView({super.key});

  void onClick () async {
    User user = Get.find();
    debugPrint(user.status.name);
    debugPrint("dddd");
    //AuthService(dio: Dio()).login("admin", "13344355");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Authorization"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: onClick, child: Text("Log in")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
