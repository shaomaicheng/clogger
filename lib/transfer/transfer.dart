import 'package:clogger/clogger.dart';
import 'package:clogger/meta/log_meta.dart';

abstract class CLoggerTransfer {
  void transferLog(LogMeta logMeta);
  void transferLogPetch(List<LogMeta> logMetas);
  void transferLogFile(LogFileMeta logFileMeta);
  void transferLogFilePetch(List<LogFileMeta> logFileMeta);

  void insertLog(LogMeta logMeta);
}
