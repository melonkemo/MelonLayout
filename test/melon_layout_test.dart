import 'package:flutter_test/flutter_test.dart';
import 'package:melon_layout/melon_layout.dart';
import 'package:melon_layout/melon_layout_platform_interface.dart';
import 'package:melon_layout/melon_layout_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMelonLayoutPlatform
    with MockPlatformInterfaceMixin
    implements MelonLayoutPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MelonLayoutPlatform initialPlatform = MelonLayoutPlatform.instance;

  test('$MethodChannelMelonLayout is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMelonLayout>());
  });

  test('getPlatformVersion', () async {
    MelonLayout melonLayoutPlugin = MelonLayout();
    MockMelonLayoutPlatform fakePlatform = MockMelonLayoutPlatform();
    MelonLayoutPlatform.instance = fakePlatform;

    expect(await melonLayoutPlugin.getPlatformVersion(), '42');
  });
}
