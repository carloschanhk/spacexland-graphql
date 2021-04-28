// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch(
    missionName: json['missionName'],
    launchDate: json['launch_date_local'],
    launchSiteName: json['site_name_long'],
    articleLink: json['articleLink'],
    videoLink: json['videoLink'],
    imageList: json['imageList'] as List,
    launchYear: json['launchYear'],
  );
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'missionName': instance.missionName,
      'launch_date_local': instance.launchDate,
      'site_name_long': instance.launchSiteName,
      'articleLink': instance.articleLink,
      'videoLink': instance.videoLink,
      'imageList': instance.imageList,
      'launchYear': instance.launchYear,
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
