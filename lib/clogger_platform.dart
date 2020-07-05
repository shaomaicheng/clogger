import 'package:clogger/logger/base_logger.dart';
import 'package:flutter/services.dart';

class CloggerPlatform {
  static const MethodChannel _channel = const MethodChannel('clogger');

  static void clogger(String name, String message, LoggerLevel level) async {
    await _channel.invokeMethod('clogger', {
      'name': name,
      'message': message,
      'level': level.index // 0 info 1 warn 2 error 3 debug
    });
  }
}
