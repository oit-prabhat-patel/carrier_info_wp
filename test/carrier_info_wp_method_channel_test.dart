import 'package:carrier_info_wp/carrier_info_wp.dart';
import 'package:carrier_info_wp/src/carrier_info_wp_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MethodChannelCarrierInfoWp platform = MethodChannelCarrierInfoWp();
  const MethodChannel channel = MethodChannel('carrier_info_wp');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return CarrierData(
        carrierName: 'name',
        isoCountryCode: 'AU',
      );
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getInfo(), isA<CarrierData>());
  });
}
