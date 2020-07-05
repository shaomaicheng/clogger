import 'package:clogger/meta/log_meta.dart';
import 'package:clogger/transfer/transfer.dart';

class TimingTransfer extends CLoggerTransfer {
  List<LogMeta> _logQueue;

  TimingTransfer() {
    _logQueue = List<LogMeta>();
  }

  @override
  void transferLog(LogMeta logMeta) {}

  @override
  void transferLogFile(LogFileMeta logFileMeta) {}

  @override
  void transferLogFilePetch(List<LogFileMeta> logFileMetas) {}

  @override
  void transferLogPetch(List<LogMeta> logMetas) {}

  @override
  void insertLog(LogMeta logMeta) {
    _logQueue.add(logMeta);
  }
}
