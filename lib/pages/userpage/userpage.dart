import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final rocketController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Text("Name:"),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your name";
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "What's your name",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
