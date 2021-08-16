import 'package:json_annotation/json_annotation.dart';

abstract class IModel {
  Map<String, dynamic> toJson();
}

abstract class Model implements IModel {
  @JsonKey()
  String? id;

  @JsonKey()
  DateTime? createdAt;

  @JsonKey()
  DateTime? updatedAt;

  Model({
    this.id,
    this.createdAt,
    this.updatedAt,
  });
}
