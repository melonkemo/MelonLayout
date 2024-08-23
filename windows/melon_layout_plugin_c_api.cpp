#include "include/melon_layout/melon_layout_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "melon_layout_plugin.h"

void MelonLayoutPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  melon_layout::MelonLayoutPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
