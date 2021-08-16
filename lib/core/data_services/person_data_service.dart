import 'package:test_coverage_exercise/core/data_services/base_data_service.dart';
import 'package:test_coverage_exercise/core/data_vo/base_data_vo.dart';
import 'package:test_coverage_exercise/core/data_vo/person_data_vo.dart';
import 'package:test_coverage_exercise/core/db_models/person_db_model.dart';
import 'package:test_coverage_exercise/core/error_service.dart';
import 'package:test_coverage_exercise/core/logger_mixin.dart';

/// Layer responsible for interacting with Application
/// and coordinates DataService calls to it.
class PersonDataService extends BaseDataService with Logging {
  PersonDataService({
    ErrorService? errorService,
  }) : super(
          name: 'PersonDataService',
          errorService: errorService,
        );

  @override
  Future<DataVO> write({
    required DataVO vo,
  }) async {
    final model = PersonDBModel.fromJson(vo.toJson());
    final result = await model.write();
    return PersonDataVO.fromJson(result.toJson());
  }

  @override
  Future<DataVO> read({
    required DataVO vo,
  }) async {
    final model = PersonDBModel.fromJson(vo.toJson());
    final result = await model.read();
    return PersonDataVO.fromJson(result.toJson());
  }
}
