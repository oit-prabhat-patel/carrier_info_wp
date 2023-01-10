import 'package:carrier_info_wp/carrier_info_wp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'carrier_info_wp_platform_interface.dart';

/// An implementation of [CarrierInfoWpPlatform] that uses method channels.
class MethodChannelCarrierInfoWp extends CarrierInfoWpPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('carrier_info_wp');

  @override
  Future<CarrierData> getInfo() async {
    late Map<dynamic, dynamic>? json;
    try {
      json = await methodChannel
          .invokeMethod<Map<dynamic, dynamic>?>('get_carrier_info_wp');
    } on PlatformException {
      json = null;
    }

    return CarrierData.fromJson(json);
  }
}
