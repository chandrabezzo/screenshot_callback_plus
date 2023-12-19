#include "include/screenshot_callback_plus/screenshot_callback_plus_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "screenshot_callback_plus_plugin.h"

void ScreenshotCallbackPlusPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  screenshot_callback_plus::ScreenshotCallbackPlusPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
