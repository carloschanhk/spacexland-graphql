class LaunchFetch {
  static String pastLaunchesFetch = """
  query fetchPastLaunches (\$launchesLimit: Int!, \$skip: Int! = 0){
    launchesPast(limit: \$launchesLimit, offset: \$skip) {
      mission_name
      launch_date_local
      launch_site {
        site_name_long
      }
      links {
        article_link
        video_link
        flickr_images
      }
      rocket {
        rocket {
          name
          cost_per_launch
          company
          description
          first_flight
          wikipedia
          success_rate_pct
          active
          country
        }
      }
      launch_year
      id
      details
    }
  }
""";
  static String rocketLaunchesFetch = """
  query (\$launchesLimit: Int!, \$skip: Int! = 0, \$rocketName: String!) {
  launchesPast(limit: \$launchesLimit, offset: \$skip, find: {rocket_name: \$rocketName}) {
    mission_name
    launch_date_local
    launch_site {
      site_name_long
    }
    links {
      article_link
      video_link
      flickr_images
    }
    rocket {
      rocket {
        name
        cost_per_launch
        company
        description
        first_flight
        wikipedia
        success_rate_pct
        active
        country
      }
    }
    launch_year
    id
    details
  }
}
  """;
}
