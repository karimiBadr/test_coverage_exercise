import 'package:json_annotation/json_annotation.dart';
import 'package:test_coverage_exercise/core/data_vo/base_data_vo.dart';

part 'person_data_vo.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
  ignoreUnannotated: false,
  includeIfNull: true,
)
class PersonDataVO extends DataVO {
  Object? driverLicence;
  Object? driverVehicles;
  String? familyName;
  String? firstName;

  PersonDataVO({
    this.firstName,
    this.familyName,
    this.driverLicence,
    this.driverVehicles,
    String? id,
  }) : super(id: id);

  factory PersonDataVO.fromJson(Map<String, dynamic> json) =>
      _$PersonDataVOFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonDataVOToJson(this);
}
