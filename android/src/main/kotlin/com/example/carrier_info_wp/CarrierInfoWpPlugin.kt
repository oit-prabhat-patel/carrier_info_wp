package com.example.carrier_info_wp

import android.content.Context
import android.telephony.TelephonyManager
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** CarrierInfoWpPlugin */
class CarrierInfoWpPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel


  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "carrier_info_wp")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "get_carrier_info_wp" -> {
        try {
          getInfo(result)
        } catch (e: Exception) {
          result.error("no_carrier_name", "No carrier name", e.toString());
        }
      }
      else -> {
        result.notImplemented()
      }}
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getInfo (result: Result) {
    val tm: TelephonyManager =
      context.getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager

    val data = hashMapOf<String, String>(
      "carrierName" to tm.simOperatorName,
      "isoCountryCode" to tm.simCountryIso,
    )
    result.success(data);
  }
}
