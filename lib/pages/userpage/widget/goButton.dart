import 'package:flutter/material.dart';
import 'package:spacexland_graphql/data/launch_fetch.dart';
import 'package:spacexland_graphql/data/rocket_fetch.dart';
import 'package:spacexland_graphql/data/user_fetch.dart';
import 'package:spacexland_graphql/model/appuser.dart';
import 'package:spacexland_graphql/model/launch.dart';
import 'package:spacexland_graphql/provider/launches_provider.dart';
import 'package:spacexland_graphql/provider/rockets_provider.dart';
import '../../../constants/ui_files.dart';

class GoButton extends StatelessWidget {
  const GoButton({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.nameController,
    @required this.rocketController,
    this.changeLoadingState,
    this.parentContext,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController rocketController;
  final Function changeLoadingState;
  final BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    GraphQLClient _client = GraphQLProvider.of(context).value;
    AppUser user;
    Rocket userRocket;
    final PastLaunchesModel launchesProvider =
        context.read<PastLaunchesModel>();
    final RocketsModel rocketProvider = context.read<RocketsModel>();
    return TextButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          changeLoadingState();
          //sending user info to the database and create user locally
          //from the returning data
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
            Map<String, dynamic> returningData =
                value.data["insert_users"]["returning"][0];
            user = AppUser.fromJson(returningData);
            userRocket = Rocket(name: returningData["rocket"]);
            //fetch rockets data
            fetchRocket(_client, rocketProvider);
            //fetch launch post data
            fetchPastLaunches(_client, launchesProvider).whenComplete(
              () {
                nameController.clear();
                rocketController.clear();
                parentContext.rootNavigator.push(
                  Routes.homePage,
                  arguments: HomePageArguments(
                    user: user,
                    changeLoadingState: changeLoadingState,
                    userRocket: userRocket,
                  ),
                );
              },
            );
          }).catchError((e) => print(e));
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

  void fetchRocket(GraphQLClient _client, RocketsModel rocketProvider) {
    _client
        .query(
      QueryOptions(
        document: gql(RocketFetch.rocketFetch),
      ),
    )
        .then((value) {
      final returningData = value.data["rockets"];
      for (var rocket in returningData) {
        rocketProvider.addRocket(rocket);
      }
    });
  }

  Future fetchPastLaunches(
      GraphQLClient _client, PastLaunchesModel launchesProvider) {
    return _client
        .query(QueryOptions(
      document: gql(LaunchFetch.pastLaunchesFetch),
      variables: {"launchesLimit": 10},
    ))
        .then((result) {
      final returningData = result.data['launchesPast'];
      for (var launch in returningData) {
        launchesProvider.addLaunches(Launch.fromJson(launch));
      }
    });
  }
}
