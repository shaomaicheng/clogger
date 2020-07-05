import 'dart:ffi';

import 'dart:io';

class NativeCallTest {
  static final DynamicLibrary nativeAddLib = Platform.isAndroid
      ? DynamicLibrary.open("libnative_add.so")
      : DynamicLibrary.process();

  static int nativeAddFTest(int x, int y) {
    final int Function(int x, int y) nativeAdd =
    nativeAddLib
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
        .asFunction();

    return nativeAdd(x, y);
  }
}
