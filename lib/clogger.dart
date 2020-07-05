import 'package:clogger/logger/base_logger.dart';
import 'package:clogger/logger/dart_logger.dart';
import 'package:clogger/logger/platform_logger.dart';

class Clogger {
  static Clogger _clogger;

  BaseLogger logger;

  Clogger._init() {}

  factory Clogger() => _inital();

  static Clogger _inital() {
    if (_clogger == null) {
      _clogger = new Clogger._init();
    }
    return _clogger;
  }

  static Clogger getInstance() {
    return _inital();
  }

  init({LogPrintType printType = LogPrintType.dart}) {
    if (printType == LogPrintType.dart) {
      logger = DartLogger();
    } else if (printType == LogPrintType.platform) {
      logger = PlatformLogger();
    } else {
      logger = DartLogger();
    }
  }
}

enum LogPrintType { dart, platform }
