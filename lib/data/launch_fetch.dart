class LaunchFetch {
  static String pastLaunchesFetch = """query fetchPastLaunches{
  launchesPast(limit: 10) {
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
        wikipedia
        description
        company
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
