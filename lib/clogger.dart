import 'package:clogger/logger/base_logger.dart';
import 'package:clogger/logger/dart_logger.dart';
import 'package:clogger/logger/platform_logger.dart';
import 'package:clogger/logger/print_and_transfer_logger.dart';
import 'package:clogger/transfer/strategy.dart';

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

  init(
      {LogPrintType printType = LogPrintType.dart,
      bool transfer = false,
      TransferType transferType = TransferType.immediately}) {
    if (!transfer) {
      if (printType == LogPrintType.dart) {
        logger = DartLogger();
      } else if (printType == LogPrintType.platform) {
        logger = PlatformLogger();
      } else {
        logger = DartLogger();
      }
    } else {
      if (printType == LogPrintType.dart) {
        logger = PrintAndTransferLogger(printType, transferType);
      } else if (printType == LogPrintType.platform) {
        logger = PrintAndTransferLogger(printType, transferType);
      } else {
        logger = PrintAndTransferLogger(printType, transferType);
      }
    }
  }
}

enum LogPrintType { dart, platform }
