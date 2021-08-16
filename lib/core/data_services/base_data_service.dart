// ignore_for_file: unused_field

import 'package:test_coverage_exercise/core/data_vo/base_data_vo.dart';
import 'package:test_coverage_exercise/core/error_service.dart';

import '../core_service.dart';

abstract class IDataService {
  Future<DataVO> write({required DataVO vo});
  Future<DataVO> read({required DataVO vo});
}

abstract class BaseDataService extends CoreService implements IDataService {
  final String name;
  final ErrorService errorService;

  BaseDataService({
    required this.name,
    ErrorService? errorService,
  })  : errorService = errorService ?? ErrorService(),
        super();
}
