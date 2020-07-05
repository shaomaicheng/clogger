import 'package:flutter/material.dart';

import 'package:clogger/clogger.dart';
import 'package:clogger/native_test.dart';
import 'package:clogger/transfer/strategy.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp() {
    Clogger.getInstance().init(CLoggerConfig(
        printType: LogPrintType.dart,
        transfer: true,
        transferType: TransferType.timing));
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: Button(
                    () {
                      Clogger.getInstance()
                          .logger
                          .info('info_demo', 'this is info info');
                    },
                    title: 'print a info log',
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Button(
                    () {
                      Clogger.getInstance()
                          .logger
                          .warn('warn_demo', 'this is warn info');
                    },
                    title: 'print a warn log',
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Button(
                    () {
                      Clogger.getInstance()
                          .logger
                          .debug('error_demo', 'this is error info');
                    },
                    title: 'print a error log',
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Button(
                    () {
                      Clogger.getInstance()
                          .logger
                          .error('error_demo', 'this is error info');
                    },
                    title: 'print a error log',
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Button(
                    () {
                      int result = NativeCallTest.nativeAddFTest(1, 2);
                      print(result.toString());
//                      Clogger.getInstance()
//                          .logger
//                          .debug('native_call_test', result.toString());
                    },
                    title: 'native call test',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final Color titleColor;
  final double width, height;
  final GestureTapCallback onPress;

  Button(this.onPress, {this.title, this.titleColor, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      onTap: onPress,
      child: Ink(
        padding: EdgeInsets.all(5),
        width: (width == null || width == 0) ? 120 : width,
        height: (height == null || height == 0) ? 44 : height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: this.titleColor ?? Colors.white),
          ),
        ),
      ),
    ));
  }
}
