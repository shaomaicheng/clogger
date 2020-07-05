
/// base class to print log
///
abstract class BaseLogger {
  info(String name, String message);
  warn(String name, String message);
  error(String name, String message);
  debug(String name, String message);
}

enum LoggerLevel{
  info,
  warn,
  error,
  debug
}