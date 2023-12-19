import 'dart:ui';

import 'screenshot_callback_plus_platform_interface.dart';

class ScreenshotCallbackPlus {
  ScreenshotCallbackPlus() {
    ScreenshotCallbackPlusPlatform.instance.initialize();
  }

  void addListener(VoidCallback callback) =>
      ScreenshotCallbackPlusPlatform.instance.addListener(callback);

  Future<void> dispose() => ScreenshotCallbackPlusPlatform.instance.dispose();
}
