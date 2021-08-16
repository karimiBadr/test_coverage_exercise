import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:test_coverage_exercise/core/data_services/base_data_service.dart';
import 'package:test_coverage_exercise/core/data_services/person_data_service.dart';
import 'package:test_coverage_exercise/core/error_service.dart';

import 'person_data_service_test.mocks.dart';

@GenerateMocks([
  ErrorService,
])
void main() {
  group(
    'PersonDataService',
    () {
      late MockErrorService errorService;
      late PersonDataService personDataService;

      setUpAll(() {
        errorService = MockErrorService();
        personDataService = PersonDataService(
          errorService: errorService,
        );
      });

      test(
        'constructor',
        () {
          expect(personDataService, isA<BaseDataService>());
          expect(personDataService.errorService, isA<ErrorService>());
        },
      );
    },
  );
}
