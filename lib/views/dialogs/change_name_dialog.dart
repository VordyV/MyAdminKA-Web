import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/models.dart';
import '/services/services.dart';

class ChangeNameDialog extends StatefulWidget {
  const ChangeNameDialog({super.key});

  @override
  State<ChangeNameDialog> createState() => _ChangeNameDialogState();
}

class _ChangeNameDialogState extends State<ChangeNameDialog> {
  final User user = Get.find();
  final TextEditingController _newNameController = TextEditingController();
  Map<String, String> _errors = {};
  bool _isProcess = false;

  void onSave(BuildContext context) async {
    _errors.clear();

    setState(() {
      _isProcess = true;
    });

    try {
      await user.changeName(_newNameController.text);
      Navigator.pop(context);
    } on ASUnpEntityException catch(e, s){
      List<dynamic> fields = e.detail['detail'];
      for (var field in fields) {
        _errors.addAll({field["loc"][1]: field["msg"]});
      }
    } on HTTPTooManyReqException catch (e, s) {

      _errors.addAll({"subtext": "Too many requests"});

      //Authorization failure
    } on HTTPBadReqException catch (e, s) {
      _errors.addAll({"subtext": "Alas, the name can't be changed. Try another day"});
    }

    setState((){
      _isProcess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Container(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              height: 54,
              child: Row(
                children: [
                  IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Change name', style: TextTheme.of(context).titleLarge),
            ),
            Divider(),
            Container(
              width: 400,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(decoration: InputDecoration(label: Text("New name"), errorText: _errors["name"]), controller: _newNameController),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FilledButton(onPressed: !_isProcess ? () => onSave(context) : null,
                        child: _isProcess ? Container(
                          width: 21,
                          height: 21,
                          child: CircularProgressIndicator(),
                        ) : Text("Save"),)
                  ),
                  Padding(padding: const EdgeInsets.all(8.0), child: Text(_errors["subtext"] ?? "", style: TextStyle(color: Colors.red)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
