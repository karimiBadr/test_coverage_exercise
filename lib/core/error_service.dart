import 'package:test_coverage_exercise/core/logger_mixin.dart';
import 'core_service.dart';

class ErrorService extends CoreService with Logging {
  // Public API
  void handleException({required Exception e}) {
    logger.warning(e.toString());
  }

  void handleError({required Exception e}) {
    logger.error(e.toString());

    _reportCrash(e);
  }

  // Private API
  void _reportCrash(dynamic e) {
    logger.debug('report crash: ${e.toString()}');

    // do something interesting here....
  }
}
