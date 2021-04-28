import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  final missionName;
  @JsonKey(name: "launch_date_local")
  final launchDate;
  @JsonKey(name: "site_name_long")
  final launchSiteName;
  final articleLink;
  final videoLink;
  final List imageList;
  final launchYear;

  Launch({
    this.missionName,
    this.launchDate,
    this.launchSiteName,
    this.articleLink,
    this.videoLink,
    this.imageList,
    this.launchYear,
  });
  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}

@JsonSerializable()
class Rocket {
  final rocketName;
  final rocketWiki;
  final rocketDescription;
  final rocketCompany;
  final rocketCountry;

  Rocket({
    this.rocketName,
    this.rocketWiki,
    this.rocketDescription,
    this.rocketCompany,
    this.rocketCountry,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);
  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
