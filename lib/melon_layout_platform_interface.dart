import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'melon_layout_method_channel.dart';

abstract class MelonLayoutPluginPlatform extends PlatformInterface {
  /// Constructs a MelonLayoutPlatform.
  MelonLayoutPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MelonLayoutPluginPlatform _instance = MethodChannelMelonLayout();

  /// The default instance of [MelonLayoutPlatform] to use.
  ///
  /// Defaults to [MethodChannelMelonLayout].
  static MelonLayoutPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MelonLayoutPlatform] when
  /// they register themselves.
  static set instance(MelonLayoutPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
