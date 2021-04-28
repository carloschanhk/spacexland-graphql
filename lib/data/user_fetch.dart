class UserFetch {
  static String addNewUser =
      """mutation addNewUser(\$name: String!, \$rocket: String!) {
  insert_users(objects: {name: \$name, rocket: \$rocket}) {
    returning {
      name
      rocket
      id
    }
  }
}""";
}
