
import 'melon_layout_platform_interface.dart';

class MelonLayout {
  Future<String?> getPlatformVersion() {
    return MelonLayoutPlatform.instance.getPlatformVersion();
  }
}
