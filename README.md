# carrier_info_wp

Carrier Info WP 

Carrier Info WP gets carrierName and isoCountryCode without any permission. 
On pub dev a lots of packages doing same features and more. For this one, no need permissions.


```dart
Example: 
final _carrierInfoWp = CarrierInfoWp();
final info = await _carrierInfoWp.getInfo();

print(info.carrierName);
print(info.isoCountryCode);
```

