class LaunchFetch {
  static String pastLaunchesFetch = """
  query fetchPastLaunches (\$launchesLimit: Int!){
    launchesPast(limit: \$launchesLimit) {
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
