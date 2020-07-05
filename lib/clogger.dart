import 'package:clogger/logger/base_logger.dart';
import 'package:clogger/logger/dart_logger.dart';
import 'package:clogger/logger/platform_logger.dart';
import 'package:clogger/logger/print_and_transfer_logger.dart';
import 'package:clogger/transfer/strategy.dart';

class Clogger {
  static Clogger _clogger;

  BaseLogger logger;

  Clogger._init();

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

  init(CLoggerConfig config) {
    _initLogger(config);
  }

  _initLogger(CLoggerConfig config) {
    if (!config.transfer) {
      switch (config.printType) {
        case LogPrintType.dart:
          logger = DartLogger();
          break;
        case LogPrintType.platform:
          logger = PlatformLogger();
          break;
          defalut:
          logger = DartLogger();
          break;
      }
    } else {
      LogPrintType printType = config.printType;
      TransferType transferType = config.transferType;
      switch (printType) {
        case LogPrintType.dart:
          logger = PrintAndTransferLogger(printType, transferType);
          break;
        case LogPrintType.platform:
          logger = PrintAndTransferLogger(printType, transferType);
          break;
          defalut:
          logger = PrintAndTransferLogger(printType, transferType);
          break;
      }
    }
  }
}

enum LogPrintType { dart, platform }

class CLoggerConfig {
  LogPrintType printType;
  bool transfer;
  TransferType transferType;

  CLoggerConfig({this.printType, this.transfer, this.transferType});
}
