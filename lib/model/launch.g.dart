// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch(
    details: json['details'],
    id: json['id'],
    launchSite: json['launch_site'] == null
        ? null
        : LaunchSite.fromJson(json['launch_site'] as Map<String, dynamic>),
    rocketHeader: json['rocket'] == null
        ? null
        : RocketHeader.fromJson(json['rocket'] as Map<String, dynamic>),
    missionName: json['mission_name'],
    launchDate: json['launch_date_local'],
    links: json['links'] == null
        ? null
        : LaunchLink.fromJson(json['links'] as Map<String, dynamic>),
    launchYear: json['launch_year'],
  );
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'mission_name': instance.missionName,
      'launch_date_local': instance.launchDate,
      'launch_site': instance.launchSite?.toJson(),
      'links': instance.links?.toJson(),
      'rocket': instance.rocketHeader?.toJson(),
      'launch_year': instance.launchYear,
      'id': instance.id,
      'details': instance.details,
    };

RocketHeader _$RocketHeaderFromJson(Map<String, dynamic> json) {
  return RocketHeader(
    json['rocket'] == null
        ? null
        : Rocket.fromJson(json['rocket'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RocketHeaderToJson(RocketHeader instance) =>
    <String, dynamic>{
      'rocket': instance.rocket?.toJson(),
    };

Rocket _$RocketFromJson(Map<String, dynamic> json) {
  return Rocket(
    rocketName: json['rocketName'],
    rocketWiki: json['rocketWiki'],
    rocketDescription: json['rocketDescription'],
    rocketCompany: json['rocketCompany'],
    rocketCountry: json['rocketCountry'],
  );
}

Map<String, dynamic> _$RocketToJson(Rocket instance) => <String, dynamic>{
      'rocketName': instance.rocketName,
      'rocketWiki': instance.rocketWiki,
      'rocketDescription': instance.rocketDescription,
      'rocketCompany': instance.rocketCompany,
      'rocketCountry': instance.rocketCountry,
    };

LaunchLink _$LaunchLinkFromJson(Map<String, dynamic> json) {
  return LaunchLink(
    json['article_link'],
    json['video_link'],
    json['flickr_images'],
  );
}

Map<String, dynamic> _$LaunchLinkToJson(LaunchLink instance) =>
    <String, dynamic>{
      'article_link': instance.articleLink,
      'video_link': instance.videoLink,
      'flickr_images': instance.imageList,
    };

LaunchSite _$LaunchSiteFromJson(Map<String, dynamic> json) {
  return LaunchSite(
    json['site_name_long'],
  );
}

Map<String, dynamic> _$LaunchSiteToJson(LaunchSite instance) =>
    <String, dynamic>{
      'site_name_long': instance.siteName,
    };
