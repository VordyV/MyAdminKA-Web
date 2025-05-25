import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/services/services.dart';
import 'package:myadminka_web/models/models.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final Map<String, TextEditingController> _controllers = {
    'name': TextEditingController(),
    'password': TextEditingController()
  };

  Map<String, String> _errors = {};
  bool _isProcess = false;

  void onClick (BuildContext context) async {
    User user = Get.find();

    //Remove all irrelevant errors and refresh the page
    _errors.clear();

    setState(() {
      _isProcess = true;
    });

    //Trying to authorize
    try {

      await user.login(_controllers['name']!.text, _controllers['password']!.text);
      context.go("/");

    //Some field did not pass validation on the server
    } on ASUnpEntityException catch(e, s){

      List<dynamic> fields = e.detail['detail'];
      for (var field in fields) {
        _errors.addAll({field["loc"][1]: field["msg"]});
      }

    //Spam protection worked
    } on HTTPTooManyReqException catch (e, s) {

      _errors.addAll({"subtext": "Too many requests"});

    //Authorization failure
    } on ASUnAuthException catch (e, s) {

      _errors.addAll({"subtext": "Login or password was incorrect"});
    }

    //After processing errors and forming the dict of `errors`, we refresh the page
    setState((){
      _isProcess = false;
    });
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
                child: TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Name', errorText: _errors["name"]), controller: _controllers['name']),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password', errorText: _errors["password"]), controller: _controllers['password']),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: !_isProcess ? () => onClick(context) : null,
                  child: _isProcess ? Container(
                    width: 21,
                    height: 21,
                    child: CircularProgressIndicator(),
                  ) : Text("Log in"),
                ), //Text("Log in")
              ),
              Padding(padding: const EdgeInsets.all(8.0), child: Text(_errors["subtext"] ?? "", style: TextStyle(color: Colors.red),),)
            ],
          ),
        ),
      ),
    );
  }
}
