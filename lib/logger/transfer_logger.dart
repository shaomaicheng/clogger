import 'package:clogger/logger/base_logger.dart';
import 'package:clogger/meta/log_meta.dart';
import 'package:clogger/meta/strategy_meta.dart';
import 'package:clogger/transfer/immediately_transfer.dart';
import 'package:clogger/transfer/pull_transfer.dart';
import 'package:clogger/transfer/strategy.dart';
import 'package:clogger/transfer/timing_transfer.dart';
import 'package:clogger/transfer/transfer.dart';

class TransferLogger extends BaseLogger {
  TransferStrategy _transferStrategy;

  CLoggerTransfer _transfer;

  TransferLogger(this._transferStrategy) {
    switch (_transferStrategy.type) {
      case TransferType.immediately:
        _transfer = ImmediatelyTransfer();
        break;
      case TransferType.timing:
        _transfer = TimingTransfer();
        break;
      case TransferType.pull:
        _transfer = PullTransfer();
        break;
    }
  }

  @override
  debug(String name, String message) {
    _insertLog(name, message, LoggerLevel.debug.index);
  }

  @override
  error(String name, String message) {
    _insertLog(name, message, LoggerLevel.error.index);
  }

  @override
  info(String name, String message) {
    _insertLog(name, message, LoggerLevel.info.index);
  }

  @override
  warn(String name, String message) {
    _insertLog(name, message, LoggerLevel.warn.index);
  }

  _insertLog(String name, String message, int logLevel) {
    DateTime now = DateTime.now();
    LogMeta logMeta = LogMeta(
        id: now.millisecondsSinceEpoch,
        timesteamp: now.millisecond,
        content: message,
        name: name,
        level: logLevel);
    _transfer.insertLog(logMeta);
  }
}
