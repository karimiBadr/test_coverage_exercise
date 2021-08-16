// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_vehicle_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverVehicleDBModel _$DriverVehicleDBModelFromJson(
        Map<String, dynamic> json) =>
    DriverVehicleDBModel(
      registrationNumber: json['registration_number'] as String?,
      tsls: (json['tsls'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DriverVehicleDBModelToJson(
        DriverVehicleDBModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'registration_number': instance.registrationNumber,
      'tsls': instance.tsls,
    };
