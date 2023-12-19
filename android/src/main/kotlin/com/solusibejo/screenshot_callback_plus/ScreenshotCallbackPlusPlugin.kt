package com.solusibejo.screenshot_callback_plus

import android.app.Activity
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** ScreenshotCallbackPlusPlugin */
class ScreenshotCallbackPlusPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var handler: Handler? = null
  private var activity: Activity? = null
  private var detector: ScreenshotDetector? = null
  private var lastScreenshotName: String? = null

  companion object {
    const val TAG = "screenshot_callback_plus"
  }

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, TAG)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method){
      MethodNames.initialize -> {
        if(activity != null){
          handler = Handler(Looper.getMainLooper())

          detector = ScreenshotDetector(activity!!.applicationContext) { name ->
            if(name != lastScreenshotName){
              lastScreenshotName = name
              handler?.post {
                channel.invokeMethod("onCallback", null)
              }
            }
          }

          detector?.start()
          result.success(MethodNames.initialize)
        }
        else {
          result.error("500", "activity is null", "activity not attached to plugin")
        }
      }
      MethodNames.dispose -> {
        detector?.stop()
        detector = null
        lastScreenshotName = null

        result.success(MethodNames.dispose)
      }
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    activity = null
  }
}
