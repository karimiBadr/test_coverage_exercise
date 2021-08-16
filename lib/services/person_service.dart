import 'package:test_coverage_exercise/core/error_service.dart';
import 'package:test_coverage_exercise/services/base_service.dart';

class PersonService extends BaseService {
  PersonService({
    ErrorService? errorService,
  }) : super(
          name: 'PersonService',
          errorService: errorService,
        );
}
