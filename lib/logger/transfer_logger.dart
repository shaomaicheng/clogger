import 'package:clogger/logger/base_logger.dart';
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
    
  }

  @override
  error(String name, String message) {}

  @override
  info(String name, String message) {}

  @override
  warn(String name, String message) {}
}
