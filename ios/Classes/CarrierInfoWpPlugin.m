#import "CarrierInfoWpPlugin.h"
#if __has_include(<carrier_info_wp/carrier_info_wp-Swift.h>)
#import <carrier_info_wp/carrier_info_wp-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "carrier_info_wp-Swift.h"
#endif

@implementation CarrierInfoWpPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCarrierInfoWpPlugin registerWithRegistrar:registrar];
}
@end
