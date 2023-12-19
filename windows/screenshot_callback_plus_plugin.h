#ifndef FLUTTER_PLUGIN_SCREENSHOT_CALLBACK_PLUS_PLUGIN_H_
#define FLUTTER_PLUGIN_SCREENSHOT_CALLBACK_PLUS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace screenshot_callback_plus {

class ScreenshotCallbackPlusPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ScreenshotCallbackPlusPlugin();

  virtual ~ScreenshotCallbackPlusPlugin();

  // Disallow copy and assign.
  ScreenshotCallbackPlusPlugin(const ScreenshotCallbackPlusPlugin&) = delete;
  ScreenshotCallbackPlusPlugin& operator=(const ScreenshotCallbackPlusPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace screenshot_callback_plus

#endif  // FLUTTER_PLUGIN_SCREENSHOT_CALLBACK_PLUS_PLUGIN_H_
