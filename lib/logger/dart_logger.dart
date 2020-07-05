import 'package:ansicolor/ansicolor.dart';
import 'package:clogger/logger/base_logger.dart';

import 'package:flutter/cupertino.dart';

/// print logs use dart api

class DartLogger extends BaseLogger {
  @override
  debug(String name, String message) {
    AnsiPen ansiPen = AnsiPen()..blue(bold: true);
    debugPrint(ansiPen(message));
  }

  @override
  error(String name, String message) {
    AnsiPen ansiPen = AnsiPen()..red(bold: true);
    debugPrint(ansiPen(message));
  }

  @override
  info(String name, String message) {
    AnsiPen ansiPen = AnsiPen()..white(bold: true);
    debugPrint(ansiPen(message));
  }

  @override
  warn(String name, String message) {
    AnsiPen ansiPen = AnsiPen()..yellow(bold: true);
    debugPrint(ansiPen(message));
  }
}
