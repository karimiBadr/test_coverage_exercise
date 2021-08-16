// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_coverage_exercise/core/db_exception.dart';

import 'package:test_coverage_exercise/core/db_models/db_model.dart';

part 'driver_licence_db_model.g.dart';

const COLLECTION_DRIVER_LICENCE = 'DriverLicence';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class DriverLicenceDBModel extends DBModel {
  @JsonKey()
  String? licenceNumber;

  @JsonKey()
  String? licenceVersion;

  @JsonKey()
  DateTime? dateOfBirth;

  DriverLicenceDBModel({
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

  factory DriverLicenceDBModel.fromJson(Map<String, dynamic> json) =>
      _$DriverLicenceDBModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DriverLicenceDBModelToJson(this);

  @override
  CollectionReference collectionReference() {
    return firestore
        .collection(COLLECTION_DRIVER_LICENCE)
        .withConverter<DriverLicenceDBModel>(
          fromFirestore: (snapshot, _) =>
              DriverLicenceDBModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        );
  }

  @override
  Future<DriverLicenceDBModel> read({Transaction? tx}) async {
    assert(id != null, 'id required to read');

    final result = await collectionReference().doc(id).get()
        as DocumentSnapshot<DriverLicenceDBModel>;

    if (result.exists) {
      return result.data() as DriverLicenceDBModel;
    } else {
      throw DBException(
        code: DBExceptionCode.DocumentNotFound,
      );
    }
  }

  @override
  Future<DriverLicenceDBModel> write({Transaction? tx}) async {
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
