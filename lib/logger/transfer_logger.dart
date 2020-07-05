import 'package:clogger/logger/base_logger.dart';
import 'package:clogger/meta/strategy_meta.dart';
import 'package:clogger/transfer/immediately_transfer.dart';
import 'package:clogger/transfer/pull_transfer.dart';
import 'package:clogger/transfer/strategy.dart';
import 'package:clogger/transfer/timing_transfer.dart';
import 'package:clogger/transfer/transfer.dart';

class TransferLogger extends BaseLogger {
  TransferStrategy transferStrategy;

  CLoggerTransfer transfer;

  TransferLogger(this.transferStrategy) {
    switch (transferStrategy.type) {
      case TransferType.immediately:
        transfer = ImmediatelyTransfer();
        break;
      case TransferType.timing:
        transfer = TimingTransfer();
        break;
      case TransferType.pull:
        transfer = PullTransfer();
        break;
    }
  }

  @override
  debug(String name, String message) {}

  @override
  error(String name, String message) {}

  @override
  info(String name, String message) {}

  @override
  warn(String name, String message) {}
}
