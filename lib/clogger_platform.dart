import 'package:flutter/services.dart';

class CloggerPlatform {
  static const MethodChannel _channel =
  const MethodChannel('clogger');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


}