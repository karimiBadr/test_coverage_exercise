import 'package:json_annotation/json_annotation.dart';

import 'model.dart';
part 'driver_licence.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DriverLicence extends Model {
  @JsonKey()
  String? licenceNumber;

  @JsonKey()
  String? licenceVersion;

  @JsonKey()
  DateTime? dateOfBirth;

  DriverLicence({
    this.licenceNumber,
    this.licenceVersion,
    this.dateOfBirth,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  factory DriverLicence.fromJson(Map<String, dynamic> json) =>
      _$DriverLicenceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DriverLicenceToJson(this);
}
