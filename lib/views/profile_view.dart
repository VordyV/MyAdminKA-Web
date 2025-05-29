import 'package:flutter/material.dart';
import '/widgets/widgets.dart';
import '/models/models.dart';
import 'package:get/get.dart';
import 'dialogs/dialogs.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final User user = Get.find();

  void onChangePassword(BuildContext context) async {
    await showDialog(context: context, builder: (BuildContext context) => ChangePasswordDialog());
    setState(() {

    });
  }

  void onChangeEmail(BuildContext context) async {
    await showDialog(context: context, builder: (BuildContext context) => ChangeEmailDialog());
    setState(() {

    });
  }

  void onChangeName(BuildContext context) async {
    await showDialog(context: context, builder: (BuildContext context) => ChangeNameDialog());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("Profile", style: TextTheme.of(context).titleLarge,),
            ),
            Container(
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.black12)
              ),
              child: DataTable(
                  headingRowHeight: 0,
                  border: TableBorder.all(color: Colors.black12, width: 1.0, style: BorderStyle.solid),
                  columns: [
                    DataColumn(label: Container()),
                    DataColumn(label: Container()),
                  ],
                  rows: [
                    DataRow(
                        cells: [
                          DataCell(Text("Name", style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(user.info.name))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Email", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(user.info.email))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("It was registered", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(user.info.dateTimeCreate))
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Last password update", style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(user.info.hashDateTimeUpdate))
                        ]
                    )
                  ]
              ),
            ),
            Divider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilledButton(onPressed: () => onChangePassword(context), child: Text("Change password")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilledButton(onPressed: () => onChangeName(context), child: Text("Change name")),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FilledButton(onPressed: () => onChangeEmail(context), child: Text("Change email")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}