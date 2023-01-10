import 'package:carrier_info_wp/src/carrier_info_wp_method_channel.dart';
import 'package:carrier_info_wp/src/carrier_info_wp_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:carrier_info_wp/carrier_info_wp.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final _data = CarrierData(
  carrierName: 'name',
  isoCountryCode: 'AU',
);

class MockCarrierInfoWpPlatform
    with MockPlatformInterfaceMixin
    implements CarrierInfoWpPlatform {
  @override
  Future<CarrierData> getInfo() => Future.value(_data);
}

void main() {
  final CarrierInfoWpPlatform initialPlatform = CarrierInfoWpPlatform.instance;

  test('$MethodChannelCarrierInfoWp is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCarrierInfoWp>());
  });

  test('getPlatformVersion', () async {
    CarrierInfoWp carrierInfoWpPlugin = CarrierInfoWp();
    MockCarrierInfoWpPlatform fakePlatform = MockCarrierInfoWpPlatform();
    CarrierInfoWpPlatform.instance = fakePlatform;

    expect(await carrierInfoWpPlugin.getInfo(), _data);
  });
}
