
import 'dart:ffi';

import 'dart:io';

typedef LoganInitDart = void Function(String, String, int, String,String);
//typedef LoganInit = void Function(Pointer<Int8>,Pointer<Int8>,Int32, Pointer<Int8>,Pointer<Int8>);
typedef LoganInit = void Function(String,String,Int32,String,String);
class Clogan {
  static final DynamicLibrary nativeLogLib = Platform.isAndroid
      ? DynamicLibrary.open("logan.so")
      : DynamicLibrary.process();

  static void init(String cacheDir,String pathDir,int maxFile,
      String encryptKey, String encryptIv) {

    final LoganInitDart nativeLoganInit = nativeLogLib
        .lookup<NativeFunction<LoganInit>>("initLogan")
        .asFunction();

  }
}