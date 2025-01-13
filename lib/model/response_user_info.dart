import 'package:json_annotation/json_annotation.dart';

part 'response_user_info.g.dart';

@JsonSerializable()
class ResponseUserInfo {
  ResponseUserInfo({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.displayName,
    this.givenName,
    this.surname,
    this.email,
    this.microsoftId,
    this.phoneNumber,
    this.synchronizeMicrosoft,
    this.totalCo2,
    this.startWorkingTime,
    this.endWorkingTime,
    this.jobTitle,
    this.officeLocation,
    this.avatar,
    this.status,
  });

  factory ResponseUserInfo.fromJson(Map<String, dynamic> json) => _$ResponseUserInfoFromJson(json);

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;

  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @JsonKey(name: 'deletedAt')
  final DateTime? deletedAt;

  @JsonKey(name: 'displayName')
  final String? displayName;

  @JsonKey(name: 'givenName')
  final String? givenName;

  @JsonKey(name: 'surname')
  final String? surname;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'microsoftId')
  final String? microsoftId;

  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;

  @JsonKey(name: 'synchronizeMicrosoft')
  final bool? synchronizeMicrosoft;

  @JsonKey(name: 'totalCo2')
  final double? totalCo2;

  @JsonKey(name: 'startWorkingTime')
  final DateTime? startWorkingTime;

  @JsonKey(name: 'endWorkingTime')
  final DateTime? endWorkingTime;

  @JsonKey(name: 'jobTitle')
  final String? jobTitle;

  @JsonKey(name: 'officeLocation')
  final String? officeLocation;

  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'status')
  final int? status;

  Map<String, dynamic> toJson() => _$ResponseUserInfoToJson(this);
}
