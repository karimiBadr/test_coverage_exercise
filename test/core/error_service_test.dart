import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';

@GenerateMocks([])
void main() {
  group(
    'ErrorService',
    () {
      test(
        'handleException()',
        () {
          expect(true, isFalse);
        },
      );
    },
  );
}
