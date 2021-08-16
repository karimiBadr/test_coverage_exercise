// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_coverage_exercise/core/db_exception.dart';

import 'package:test_coverage_exercise/core/db_models/db_model.dart';

part 'driver_vehicle_db_model.g.dart';

const COLLECTION_PERSON = 'DriverVehicle';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class DriverVehicleDBModel extends DBModel {
  @JsonKey()
  String? registrationNumber;

  @JsonKey()
  List<String>? tsls;

  DriverVehicleDBModel({
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

  factory DriverVehicleDBModel.fromJson(Map<String, dynamic> json) =>
      _$DriverVehicleDBModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DriverVehicleDBModelToJson(this);

  @override
  CollectionReference collectionReference() {
    return firestore
        .collection(COLLECTION_PERSON)
        .withConverter<DriverVehicleDBModel>(
          fromFirestore: (snapshot, _) =>
              DriverVehicleDBModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  @override
  Future<DriverVehicleDBModel> read({Transaction? tx}) async {
    assert(id != null, 'id required to read');

    final result = await collectionReference().doc(id).get()
        as DocumentSnapshot<DriverVehicleDBModel>;

    if (result.exists) {
      return result.data() as DriverVehicleDBModel;
    } else {
      throw DBException(
        code: DBExceptionCode.DocumentNotFound,
      );
    }
  }

  @override
  Future<DriverVehicleDBModel> write({Transaction? tx}) async {
    bool isNew;
    if (isNew = id is! String) {
      id = generateId();
    }

    try {
      if (isNew) {
        await collectionReference().add(this);
      } else {
        await collectionReference().doc(id).set(this);
      }

      return read();
    } on Exception {
      throw DBException(
        code: DBExceptionCode.Internal,
      );
    }
  }
}
