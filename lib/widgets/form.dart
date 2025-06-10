import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form_text_field.dart';

class PrimaryForm extends StatelessWidget {

  final String title;
  final List<Widget> body;
  final List<Widget> actions;
  final String errorMessage;

  const PrimaryForm({super.key, required this.title, required this.body, required this.actions, this.errorMessage = ""});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
                  child: Text(this.title, style: TextTheme.of(context).titleLarge),
                ),
                const Divider(),
                Column(
                  children: body,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Visibility(
                    visible: this.errorMessage.isNotEmpty,
                    child: Row(
                      children: [Icon(Icons.warning, color: Theme.of(context).primaryColor), SelectableText(this.errorMessage, style: TextStyle(color: Theme.of(context).primaryColor))],
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: this.actions,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
