import 'package:flutter/material.dart';
import 'package:spacexland_graphql/constants/ui_files.dart';
import 'package:spacexland_graphql/pages/userpage/widget/goButton.dart';
import 'widget/inputRow.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final rocketController = TextEditingController();
  bool loading = false;
  @override
  void initState() {
    super.initState();
  }

  void _changeLoadingState() {
    print("called");
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: Config.initialClient(),
      child: loading
          ? LoadingWidget()
          : Scaffold(
              body: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputRow(
                      textController: nameController,
                      field: "Name",
                    ).padding(bottom: 20),
                    InputRow(
                      textController: rocketController,
                      field: "Rocket",
                    ).padding(bottom: 20),
                    GoButton(
                      formKey: _formKey,
                      nameController: nameController,
                      rocketController: rocketController,
                      changeLoadingState: _changeLoadingState,
                      parentContext: context,
                    ),
                    // loading
                    //     ? CircularProgressIndicator().padding(vertical: 40)
                    //     : Container(),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ).padding(horizontal: 20),
              ),
            ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
