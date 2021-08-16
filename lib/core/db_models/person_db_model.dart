// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_coverage_exercise/core/db_exception.dart';

import 'package:test_coverage_exercise/core/db_models/db_model.dart';
import 'package:test_coverage_exercise/core/db_models/driver_licence_db_model.dart';
import 'package:test_coverage_exercise/core/db_models/driver_vehicle_db_model.dart';

part 'person_db_model.g.dart';

const COLLECTION_PERSON = 'Person';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  explicitToJson: true,
)
class PersonDBModel extends DBModel {
  @JsonKey()
  String? firstName;

  @JsonKey()
  String? familyName;

  @JsonKey()
  DriverLicenceDBModel? driverLicence;

  @JsonKey()
  List<DriverVehicleDBModel>? driverVehicles;

  PersonDBModel({
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

  factory PersonDBModel.fromJson(Map<String, dynamic> json) =>
      _$PersonDBModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PersonDBModelToJson(this);

  @override
  CollectionReference collectionReference() {
    return firestore.collection(COLLECTION_PERSON).withConverter<PersonDBModel>(
          fromFirestore: (snapshot, _) =>
              PersonDBModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  @override
  Future<PersonDBModel> read({Transaction? tx}) async {
    assert(id != null, 'id required to read');

    final result = await collectionReference().doc(id).get()
        as DocumentSnapshot<PersonDBModel>;

    if (result.exists) {
      return result.data() as PersonDBModel;
    } else {
      throw DBException(
        code: DBExceptionCode.DocumentNotFound,
      );
    }
  }

  @override
  Future<PersonDBModel> write({Transaction? tx}) async {
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
