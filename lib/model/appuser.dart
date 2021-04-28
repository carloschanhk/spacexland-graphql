import 'package:json_annotation/json_annotation.dart';

part 'appuser.g.dart';

@JsonSerializable()
class AppUser {
  @JsonKey(name: 'name')
  final String userName;
  @JsonKey(name: 'rocket')
  final String userRocket;

  AppUser(
    this.userName,
    this.userRocket,
  );

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
