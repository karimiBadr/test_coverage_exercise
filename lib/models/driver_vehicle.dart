import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'driver_vehicle.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DriverVehicle extends Model {
  @JsonKey()
  String? registrationNumber;

  @JsonKey()
  List<String>? tsls;

  DriverVehicle({
    this.registrationNumber,
    this.tsls,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory DriverVehicle.fromJson(Map<String, dynamic> json) =>
      _$DriverVehicleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DriverVehicleToJson(this);
}
