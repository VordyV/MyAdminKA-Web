import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {

  final Widget label;
  final bool isPassword;
  final int maxLength;
  final bool autofocus;
  
  const CTextField({super.key, this.isPassword = false, this.maxLength = 255, this.autofocus = false, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: label,
        ),
        TextField(
          autofocus: autofocus,
          obscureText: isPassword,
          autocorrect: !isPassword,
          enableSuggestions: !isPassword,
          maxLength: maxLength,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            counterText: ""
          ),
        ),
      ],
    );
  }
}
