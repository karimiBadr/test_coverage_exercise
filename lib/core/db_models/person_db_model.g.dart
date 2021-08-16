// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDBModel _$PersonDBModelFromJson(Map<String, dynamic> json) =>
    PersonDBModel(
      firstName: json['first_name'] as String?,
      familyName: json['family_name'] as String?,
      driverLicence: json['driver_licence'] == null
          ? null
          : DriverLicenceDBModel.fromJson(
              json['driver_licence'] as Map<String, dynamic>),
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    )..driverVehicles = (json['driver_vehicles'] as List<dynamic>?)
        ?.map((e) => DriverVehicleDBModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$PersonDBModelToJson(PersonDBModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'first_name': instance.firstName,
      'family_name': instance.familyName,
      'driver_licence': instance.driverLicence?.toJson(),
      'driver_vehicles':
          instance.driverVehicles?.map((e) => e.toJson()).toList(),
    };
