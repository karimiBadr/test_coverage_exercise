import 'package:test_coverage_exercise/core/data_services/person_data_service.dart';
import 'package:test_coverage_exercise/core/data_vo/person_data_vo.dart';
import 'package:test_coverage_exercise/core/db_exception.dart';
import 'package:test_coverage_exercise/core/error_service.dart';
import 'package:test_coverage_exercise/models/model.dart';
import 'package:test_coverage_exercise/models/person.dart';
import 'package:test_coverage_exercise/services/base_service.dart';

class PersonService extends BaseService {
  late final PersonDataService _personDataService;

  PersonService({
    ErrorService? errorService,
    PersonDataService? personDataService,
  })  : _personDataService = personDataService ?? PersonDataService(),
        super(
          name: 'PersonService',
          errorService: errorService,
        );

  @override
  Future<Model> create({required Model model}) async {
    try {
      final dataVO = PersonDataVO.fromJson(model.toJson());
      final result = await _personDataService.write(vo: dataVO);

      return Person.fromJson(result.toJson());
    } on DBException catch (e) {
      rethrow;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<Model> read({required Model model}) async {
    try {
      final dataVO = PersonDataVO.fromJson(model.toJson());
      final result = await _personDataService.read(vo: dataVO);

      return Person.fromJson(result.toJson());
    } on DBException catch (e) {
      rethrow;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
