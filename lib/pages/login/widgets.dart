import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {

  final Widget label;
  
  const CTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: label,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder()
          ),
        ),
      ],
    );
  }
}
