// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';

enum DBExceptionCode {
  Unknown,
  Internal,
  MoreThanOneFound,
  NoID,
  DataNotSet,
  InvalidState,
  NoData,
  BatchUpdateFailed,
  BatchCommitFailed,
  DocumentNotFound,
  DocumentAlreadyExists,
  FailedPrecondition,
  IneligibleToStateTransition,
  IneligibleToActivate,
  IneligbleToArchive,
  IneligibleToTypeTransition,
}

class DBException implements Exception {
  final String? message;
  final DBExceptionCode code;

  DBException({
    this.message,
    this.code = DBExceptionCode.DocumentNotFound,
  });

  @override
  String toString() => '[${describeEnum(code)}] $message';
}
