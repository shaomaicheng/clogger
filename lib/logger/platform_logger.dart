import 'package:clogger/logger/base_logger.dart';

import '../clogger_platform.dart';

class PlatformLogger extends BaseLogger {
  @override
  debug(String name, String message) {
    CloggerPlatform.clogger(name, message, LoggerLevel.debug);
  }

  @override
  error(String name, String message) {
    CloggerPlatform.clogger(name, message, LoggerLevel.error);
  }

  @override
  info(String name, String message) {
    CloggerPlatform.clogger(name, message, LoggerLevel.info);
  }

  @override
  warn(String name, String message) {
    CloggerPlatform.clogger(name, message, LoggerLevel.warn);
  }
}
