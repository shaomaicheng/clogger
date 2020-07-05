import 'package:clogger/clogger.dart';
import 'package:clogger/logger/base_logger.dart';
import 'package:clogger/logger/dart_logger.dart';
import 'package:clogger/logger/platform_logger.dart';
import 'package:clogger/logger/transfer_logger.dart';
import 'package:clogger/meta/strategy_meta.dart';
import 'package:clogger/transfer/strategy.dart';

class PrintAndTransferLogger extends BaseLogger {
  LogPrintType logPrintType;
  BaseLogger _printLogger;
  TransferLogger _transferLogger;

  PrintAndTransferLogger(LogPrintType logPrintType, TransferType transferType) {
    _printLogger =
        logPrintType == LogPrintType.dart ? DartLogger() : PlatformLogger();

    _transferLogger = TransferLogger(TransferStrategy(transferType));
  }

  @override
  debug(String name, String message) {
    _printLogger.debug(name, message);
    _transferLogger.debug(name, message);
  }

  @override
  error(String name, String message) {
    _printLogger.error(name, message);
    _transferLogger.debug(name, message);
  }

  @override
  info(String name, String message) {
    _printLogger.info(name, message);
    _transferLogger.debug(name, message);
  }

  @override
  warn(String name, String message) {
    _printLogger.info(name, message);
    _transferLogger.warn(name, message);
  }
}
