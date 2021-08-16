import 'package:logger/logger.dart';

mixin Logging {
  Logger? _logger;

  Logging get logger {
    if (_logger == null) {
      _initLogger();
    }
    return this;
  }

  void _initLogger() {
    _logger = Logger(
      printer: SimplePrinter(
        colors: true,
        printTime: false,
      ),
      level: Level.info,
    );
  }

  String _prefixMsg(String msg) {
    return '$runtimeType - $msg';
  }

  /// alias to i
  void info(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger?.i(_prefixMsg(message), error, stackTrace);

  /// alias to e
  void error(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger?.e(_prefixMsg(message), error, stackTrace);

  /// alias to w
  void warning(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger?.w(_prefixMsg(message), error, stackTrace);

  /// alias to d
  void debug(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger?.d(_prefixMsg(message), error, stackTrace);
}
