import 'dart:ui';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'screenshot_callback_plus_method_channel.dart';

abstract class ScreenshotCallbackPlusPlatform extends PlatformInterface {
  /// Constructs a ScreenshotCallbackPlusPlatform.
  ScreenshotCallbackPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScreenshotCallbackPlusPlatform _instance =
      MethodChannelScreenshotCallbackPlus();

  /// The default instance of [ScreenshotCallbackPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelScreenshotCallbackPlus].
  static ScreenshotCallbackPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScreenshotCallbackPlusPlatform] when
  /// they register themselves.
  static set instance(ScreenshotCallbackPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void addListener(VoidCallback callback) =>
      throw UnimplementedError('addCallback() has not been implemented');

  /// Initializes screenshot callback plugin
  Future<void> initialize() async =>
      throw UnimplementedError('initialize() has not been implemented');

  /// Remove callback listener
  Future<void> dispose() async =>
      throw UnimplementedError('dispose() has not been implemented');
}
