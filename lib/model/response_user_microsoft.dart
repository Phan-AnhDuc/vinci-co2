import 'package:json_annotation/json_annotation.dart';

part 'response_user_microsoft.g.dart';

@JsonSerializable()
class ResponseUserMicrosoft {
  ResponseUserMicrosoft({
    this.displayName,
    this.givenName,
    this.surname,
    this.userPrincipalName,
    this.email,
    this.businessPhones,
    this.jobTitle,
    this.mail,
    this.mobilePhone,
    this.officeLocation,
    this.preferredLanguage,
    this.id,
  });

  factory ResponseUserMicrosoft.fromJson(Map<String, dynamic> json) => _$ResponseUserMicrosoftFromJson(json);

  @JsonKey(name: 'displayName')
  final String? displayName;

  @JsonKey(name: 'givenName')
  final String? givenName;

  @JsonKey(name: 'surname')
  final String? surname;

  @JsonKey(name: 'userPrincipalName')
  final String? userPrincipalName;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'businessPhones')
  final List<String>? businessPhones;

  @JsonKey(name: 'jobTitle')
  final String? jobTitle;

  @JsonKey(name: 'mail')
  final String? mail;

  @JsonKey(name: 'mobilePhone')
  final String? mobilePhone;

  @JsonKey(name: 'officeLocation')
  final String? officeLocation;

  @JsonKey(name: 'preferredLanguage')
  final String? preferredLanguage;

  @JsonKey(name: 'id')
  final String? id;

  Map<String, dynamic> toJson() => _$ResponseUserMicrosoftToJson(this);
}
