import Flutter
import UIKit
import CoreTelephony

public class SwiftCarrierInfoWpPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "carrier_info_wp", binaryMessenger: registrar.messenger())
        let instance = SwiftCarrierInfoWpPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "get_carrier_info_wp"){
            getInfo(result: result)
        }else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func getInfo(result: @escaping FlutterResult){
        let networkInfo = CTTelephonyNetworkInfo()
        if #available(iOS 12.0, *) {
            if let carriers = networkInfo.serviceSubscriberCellularProviders {
                var data =  [String: String?]()
                let carr = carriers.values.first
                
                data["carrierName"] = carr?.carrierName
                data["isoCountryCode"] =  carr?.isoCountryCode
                result(data)
            }else {
                result(nil)
            }
        } else if(networkInfo.subscriberCellularProvider != nil){
            
            let carr = networkInfo.subscriberCellularProvider!
            var data =  [String: String?]()
            data["carrierName"] = carr.carrierName
            data["isoCountryCode"] =  carr.isoCountryCode
            result(data)
        }else {
            result(nil)
        }
    }
}
