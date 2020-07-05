import 'package:ansicolor/ansicolor.dart';
import 'package:clogger/logger/base_logger.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
/// print logs use dart api

class DartLogger extends BaseLogger {
  @override
  debug(String name, String message) {
    // TODO: implement debug
    throw UnimplementedError();
  }

  @override
  error(String name, String message) {
    AnsiPen ansiPen = AnsiPen()..red(bold: true);
   debugPrint(ansiPen(message));
  log(message, name: name);
  }

  @override
  info(String name, String message) {
    // TODO: implement info
    throw UnimplementedError();
  }

  @override
  warn(String name, String message) {
    // TODO: implement warn
    throw UnimplementedError();
  }
}
