#ifndef FLUTTER_PLUGIN_MELON_LAYOUT_PLUGIN_H_
#define FLUTTER_PLUGIN_MELON_LAYOUT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace melon_layout {

class MelonLayoutPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MelonLayoutPlugin();

  virtual ~MelonLayoutPlugin();

  // Disallow copy and assign.
  MelonLayoutPlugin(const MelonLayoutPlugin&) = delete;
  MelonLayoutPlugin& operator=(const MelonLayoutPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace melon_layout

#endif  // FLUTTER_PLUGIN_MELON_LAYOUT_PLUGIN_H_
