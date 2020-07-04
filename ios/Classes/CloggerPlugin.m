#import "CloggerPlugin.h"
#if __has_include(<clogger/clogger-Swift.h>)
#import <clogger/clogger-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "clogger-Swift.h"
#endif

@implementation CloggerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCloggerPlugin registerWithRegistrar:registrar];
}
@end
