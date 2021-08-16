import 'package:test_coverage_exercise/core/error_service.dart';
import 'package:test_coverage_exercise/models/model.dart';

abstract class IService {
  Future<Model> create({required Model model});
  Future<Model> read({required Model model});
}

abstract class BaseService implements IService {
  final String name;
  final ErrorService errorService;

  BaseService({
    required this.name,
    ErrorService? errorService,
  })  : errorService = errorService ?? ErrorService(),
        super();
}
