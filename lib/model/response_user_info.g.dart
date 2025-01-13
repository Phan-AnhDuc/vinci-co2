// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserInfo _$ResponseUserInfoFromJson(Map<String, dynamic> json) =>
    ResponseUserInfo(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      displayName: json['displayName'] as String?,
      givenName: json['givenName'] as String?,
      surname: json['surname'] as String?,
      email: json['email'] as String?,
      microsoftId: json['microsoftId'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      synchronizeMicrosoft: json['synchronizeMicrosoft'] as bool?,
      totalCo2: (json['totalCo2'] as num?)?.toDouble(),
      startWorkingTime: json['startWorkingTime'] == null
          ? null
          : DateTime.parse(json['startWorkingTime'] as String),
      endWorkingTime: json['endWorkingTime'] == null
          ? null
          : DateTime.parse(json['endWorkingTime'] as String),
      jobTitle: json['jobTitle'] as String?,
      officeLocation: json['officeLocation'] as String?,
      avatar: json['avatar'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResponseUserInfoToJson(ResponseUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'displayName': instance.displayName,
      'givenName': instance.givenName,
      'surname': instance.surname,
      'email': instance.email,
      'microsoftId': instance.microsoftId,
      'phoneNumber': instance.phoneNumber,
      'synchronizeMicrosoft': instance.synchronizeMicrosoft,
      'totalCo2': instance.totalCo2,
      'startWorkingTime': instance.startWorkingTime?.toIso8601String(),
      'endWorkingTime': instance.endWorkingTime?.toIso8601String(),
      'jobTitle': instance.jobTitle,
      'officeLocation': instance.officeLocation,
      'avatar': instance.avatar,
      'status': instance.status,
    };
