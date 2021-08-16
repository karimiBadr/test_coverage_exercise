// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_licence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverLicence _$DriverLicenceFromJson(Map<String, dynamic> json) =>
    DriverLicence(
      licenceNumber: json['licence_number'] as String?,
      licenceVersion: json['licence_version'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DriverLicenceToJson(DriverLicence instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'licence_number': instance.licenceNumber,
      'licence_version': instance.licenceVersion,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
    };
