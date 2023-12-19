import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:screenshot_callback_plus/src/constants.dart';
import 'package:screenshot_callback_plus/src/methods.dart';

import 'screenshot_callback_plus_platform_interface.dart';

/// An implementation of [ScreenshotCallbackPlusPlatform] that uses method channels.
class MethodChannelScreenshotCallbackPlus
    extends ScreenshotCallbackPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel(Constants.pluginName);

  ///Functions to execute when callback fired.
  final onCallbacks = <VoidCallback>[];

  @override
  void addListener(VoidCallback callback) => onCallbacks.add(callback);

  @override
  Future<void> initialize() async {
    methodChannel.setMethodCallHandler(_handleMethod);
    await methodChannel.invokeMethod(Methods.initialize);
  }

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case Methods.onCallback:
        for (VoidCallback callback in onCallbacks) {
          callback();
        }
        break;
      default:
        throw UnimplementedError('method not defined');
    }
  }

  @override
  Future<void> dispose() async =>
      await methodChannel.invokeMethod(Methods.dispose);
}
