import 'package:clogger/meta/log_meta.dart';

abstract class CLoggerTransfer {
  void transferLog(LogMeta logMeta);
  void transferLogPetch(List<LogMeta> logMetas);
  void transferLogFile(LogFileMeta logFileMeta);
  void transferLogFilePetch(List<LogFileMeta> logFileMetas);
}
