import 'package:json_annotation/json_annotation.dart';

part 'appuser.g.dart';

@JsonSerializable()
class AppUser {
  final String userName;
  final String userRocket;

  AppUser(
    @JsonKey(name: 'name') this.userName,
    @JsonKey(name: 'rocket') this.userRocket,
  );

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
