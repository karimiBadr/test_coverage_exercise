// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_data_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDataVO _$PersonDataVOFromJson(Map<String, dynamic> json) => PersonDataVO(
      firstName: json['first_name'] as String?,
      familyName: json['family_name'] as String?,
      driverLicence: json['driver_licence'],
      driverVehicles: json['driver_vehicles'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PersonDataVOToJson(PersonDataVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driver_licence': instance.driverLicence,
      'driver_vehicles': instance.driverVehicles,
      'family_name': instance.familyName,
      'first_name': instance.firstName,
    };
