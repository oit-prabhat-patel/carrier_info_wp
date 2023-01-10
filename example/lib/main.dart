import 'package:flutter/material.dart';
import 'dart:async';

import 'package:carrier_info_wp/carrier_info_wp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CarrierData? carrierData;
  final _carrierInfoWp = CarrierInfoWp();

  @override
  void initState() {
    super.initState();

    /// TO avoid calling 'setState' method during build method
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadInfo();
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> loadInfo() async {
    final info = await _carrierInfoWp.getInfo();

    setState(() {
      carrierData = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carrier info wp example app'),
        ),
        body: Center(
          child: Column(
            children: [
              if (carrierData != null) ...[
                Text('Carrier name : ${carrierData?.carrierName}'),
                const SizedBox(
                  height: 16,
                ),
                Text('Iso country code : ${carrierData?.isoCountryCode}')
              ],
            ],
          ),
        ),
      ),
    );
  }
}
