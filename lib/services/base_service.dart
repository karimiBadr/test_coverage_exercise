import 'package:test_coverage_exercise/core/error_service.dart';

abstract class IService {}

abstract class BaseService {
  final String name;
  final ErrorService errorService;

  BaseService({
    required this.name,
    ErrorService? errorService,
  })  : errorService = errorService ?? ErrorService(),
        super();
}
