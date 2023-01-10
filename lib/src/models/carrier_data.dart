class CarrierData {
  ///  The Service Provider Name (SPN).
  final String? carrierName;

  /// Country code, [us,au,en ect..]
  final String? isoCountryCode;

  CarrierData({
    this.carrierName,
    this.isoCountryCode,
  });

  factory CarrierData.fromJson(Map<dynamic, dynamic>? json) {
    return CarrierData(
      carrierName: json?['carrierName'] as String?,
      isoCountryCode: json?['isoCountryCode'] as String?,
    );
  }
}
