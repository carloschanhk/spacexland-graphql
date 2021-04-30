import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';
part 'launch.g.dart';

@JsonSerializable(explicitToJson: true)
class Launch {
  @JsonKey(name: 'mission_name')
  final missionName;
  @JsonKey(name: "launch_date_local")
  final launchDate;
  final formattedDate;
  @JsonKey(name: "launch_site")
  final LaunchSite launchSite;
  final LaunchLink links;
  @JsonKey(name: "rocket")
  final RocketHeader rocketHeader;
  @JsonKey(name: 'launch_year')
  final launchYear;
  final id;
  final details;
  @JsonKey(defaultValue: false)
  bool isLiked;

  Launch(
      {this.details,
      this.id,
      this.launchSite,
      this.rocketHeader,
      this.missionName,
      this.launchDate,
      this.links,
      this.launchYear,
      this.isLiked})
      : formattedDate =
            DateFormat('MMM dd, yyyy').format(DateTime.parse(launchDate));

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RocketHeader {
  final Rocket rocket;

  RocketHeader(this.rocket);

  factory RocketHeader.fromJson(Map<String, dynamic> json) =>
      _$RocketHeaderFromJson(json);
  Map<String, dynamic> toJson() => _$RocketHeaderToJson(this);
}

@JsonSerializable()
class Rocket {
  final name;
  final wikipedia;
  final description;
  final company;
  final country;
  @JsonKey(name: 'cost_per_launch')
  final costPerLaunch;
  @JsonKey(name: 'first_flight')
  final firstFlight;
  @JsonKey(name: 'success_rate_pct')
  final successRatePct;
  final active;

  Rocket({
    this.costPerLaunch,
    this.firstFlight,
    this.successRatePct,
    this.active,
    this.wikipedia,
    this.description,
    this.company,
    this.country,
    this.name,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
  Map<String, dynamic> toJson() => _$RocketToJson(this);
}

@JsonSerializable()
class LaunchLink {
  @JsonKey(name: 'article_link')
  final articleLink;
  @JsonKey(name: 'video_link')
  final videoLink;
  @JsonKey(name: 'flickr_images')
  final imageList;

  LaunchLink(this.articleLink, this.videoLink, this.imageList);

  factory LaunchLink.fromJson(Map<String, dynamic> json) =>
      _$LaunchLinkFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchLinkToJson(this);
}

@JsonSerializable()
class LaunchSite {
  @JsonKey(name: 'site_name_long')
  final siteName;

  LaunchSite(this.siteName);

  factory LaunchSite.fromJson(Map<String, dynamic> json) =>
      _$LaunchSiteFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchSiteToJson(this);
}
