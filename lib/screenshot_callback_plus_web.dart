// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'screenshot_callback_plus_platform_interface.dart';

/// A web implementation of the ScreenshotCallbackPlusPlatform of the ScreenshotCallbackPlus plugin.
class ScreenshotCallbackPlusWeb extends ScreenshotCallbackPlusPlatform {
  /// Constructs a ScreenshotCallbackPlusWeb
  ScreenshotCallbackPlusWeb();

  static void registerWith(Registrar registrar) {
    ScreenshotCallbackPlusPlatform.instance = ScreenshotCallbackPlusWeb();
  }
}
