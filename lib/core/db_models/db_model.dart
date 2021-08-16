import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_coverage_exercise/core/db_exception.dart';

abstract class IDBModel {
  CollectionReference collectionReference();

  Future<bool> exists({Transaction? tx});

  Future<DBModel> write({Transaction? tx});

  Future<DBModel> read({Transaction? tx});

  Map<String, dynamic> toJson();
}

abstract class DBModel implements IDBModel {
  @JsonKey()
  String? id;

  @JsonKey()
  DateTime? createdAt;

  @JsonKey()
  DateTime? updatedAt;

  DBModel({
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  // getters/setters
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  DocumentReference<Object?> get documentReference {
    assert(id is String);

    return collectionReference().doc(id!);
  }

  String generateId() {
    return collectionReference().doc().id;
  }

  @override
  Future<bool> exists({Transaction? tx}) async {
    assert(id is String, 'id required to check existence');

    DocumentSnapshot readData;
    try {
      if (tx is! Transaction) {
        readData = await documentReference.get();
      } else {
        readData = await tx.get(documentReference);
      }
    } catch (e) {
      throw DBException(
        code: DBExceptionCode.Internal,
        message: e.toString(),
      );
    }

    return readData.exists;
  }
}
