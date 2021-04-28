import 'package:flutter/material.dart';
import 'package:spacexland_graphql/data/user_fetch.dart';
import 'package:spacexland_graphql/model/appuser.dart';
import '../../../constants/ui_files.dart';

class GoButton extends StatelessWidget {
  const GoButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.nameController,
    @required this.rocketController,
    this.changeLoadingState,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController rocketController;
  final Function changeLoadingState;

  @override
  Widget build(BuildContext context) {
    GraphQLClient _client = GraphQLProvider.of(context).value;
    return TextButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          changeLoadingState();
          _client
              .mutate(
            MutationOptions(
              document: gql(UserFetch.addNewUser),
              variables: {
                "name": nameController.text,
                "rocket": rocketController.text
              },
            ),
          )
              .then((value) {
            final returningData = value.data["insert_users"]["returning"][0];
            AppUser user = AppUser(
              returningData["name"],
              returningData["rocket"],
            );
            changeLoadingState();
            context.rootNavigator.push(
              Routes.homePage,
              arguments: HomePageArguments(
                user: user,
              ),
            );
          });
          nameController.clear();
          rocketController.clear();
        }
      },
      child: Text(
        "Go",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
