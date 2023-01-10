import 'package:carrier_info_wp/carrier_info_wp.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'carrier_info_wp_method_channel.dart';

abstract class CarrierInfoWpPlatform extends PlatformInterface {
  /// Constructs a CarrierInfoWpPlatform.
  CarrierInfoWpPlatform() : super(token: _token);

  static final Object _token = Object();

  static CarrierInfoWpPlatform _instance = MethodChannelCarrierInfoWp();

  /// The default instance of [CarrierInfoWpPlatform] to use.
  ///
  /// Defaults to [MethodChannelCarrierInfoWp].
  static CarrierInfoWpPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CarrierInfoWpPlatform] when
  /// they register themselves.
  static set instance(CarrierInfoWpPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<CarrierData> getInfo() {
    throw UnimplementedError('getInfo() has not been implemented.');
  }
}
