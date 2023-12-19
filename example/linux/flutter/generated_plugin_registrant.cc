//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <screenshot_callback_plus/screenshot_callback_plus_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) screenshot_callback_plus_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ScreenshotCallbackPlusPlugin");
  screenshot_callback_plus_plugin_register_with_registrar(screenshot_callback_plus_registrar);
}
