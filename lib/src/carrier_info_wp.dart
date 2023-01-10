import 'package:carrier_info_wp/carrier_info_wp.dart';

import 'carrier_info_wp_platform_interface.dart';

class CarrierInfoWp {
  Future<CarrierData> getInfo() {
    return CarrierInfoWpPlatform.instance.getInfo();
  }
}
