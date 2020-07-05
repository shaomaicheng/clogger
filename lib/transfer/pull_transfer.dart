import 'package:clogger/meta/log_meta.dart';
import 'package:clogger/transfer/transfer.dart';

class PullTransfer extends CLoggerTransfer {
  @override
  void transferLog(LogMeta logMeta) {}

  @override
  void transferLogFile(LogFileMeta logFileMeta) {}

  @override
  void transferLogFilePetch(List<LogFileMeta> logFileMetas) {}

  @override
  void transferLogPetch(List<LogMeta> logMetas) {}

  @override
  void insertLog(LogMeta logMeta) {}
}
