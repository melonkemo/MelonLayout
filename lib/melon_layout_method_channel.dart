import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'melon_layout_platform_interface.dart';

/// An implementation of [MelonLayoutPlatform] that uses method channels.
class MethodChannelMelonLayout extends MelonLayoutPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('melon_layout');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
