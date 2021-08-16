import 'package:json_annotation/json_annotation.dart';

import 'driver_licence.dart';
import 'driver_vehicle.dart';
import 'model.dart';

part 'person.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
@JsonSerializable()
class Person extends Model {
  @JsonKey()
  String? firstName;

  @JsonKey()
  String? familyName;

  @JsonKey()
  DriverLicence? driverLicence;

  @JsonKey()
  List<DriverVehicle>? driverVehicles;

  Person({
    this.firstName,
    this.familyName,
    this.driverLicence,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
