// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_user_microsoft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserMicrosoft _$ResponseUserMicrosoftFromJson(
        Map<String, dynamic> json) =>
    ResponseUserMicrosoft(
      displayName: json['displayName'] as String?,
      givenName: json['givenName'] as String?,
      surname: json['surname'] as String?,
      userPrincipalName: json['userPrincipalName'] as String?,
      email: json['email'] as String?,
      businessPhones: (json['businessPhones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      jobTitle: json['jobTitle'] as String?,
      mail: json['mail'] as String?,
      mobilePhone: json['mobilePhone'] as String?,
      officeLocation: json['officeLocation'] as String?,
      preferredLanguage: json['preferredLanguage'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ResponseUserMicrosoftToJson(
        ResponseUserMicrosoft instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'givenName': instance.givenName,
      'surname': instance.surname,
      'userPrincipalName': instance.userPrincipalName,
      'email': instance.email,
      'businessPhones': instance.businessPhones,
      'jobTitle': instance.jobTitle,
      'mail': instance.mail,
      'mobilePhone': instance.mobilePhone,
      'officeLocation': instance.officeLocation,
      'preferredLanguage': instance.preferredLanguage,
      'id': instance.id,
    };
