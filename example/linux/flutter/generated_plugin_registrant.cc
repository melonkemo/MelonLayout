//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <melon_layout/melon_layout_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) melon_layout_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MelonLayoutPlugin");
  melon_layout_plugin_register_with_registrar(melon_layout_registrar);
}
