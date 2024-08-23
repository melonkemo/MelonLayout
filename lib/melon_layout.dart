import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'melon_layout_platform_interface.dart';

enum MelonLayoutScale { mobile, tablet, desktop }

enum MelonLayoutPlatform { web, ios, android, desktop }

class MelonLayout {
  static final MelonLayout _instance = MelonLayout._internal();

  factory MelonLayout() {
    return _instance;
  }

  static MelonLayout get instance => _instance;

  MelonLayout._internal();

  late BuildContext context;

  double? tablet;
  double? desktop;

  void init({double? tablet, required double desktop}) {
    this.tablet = tablet;
    this.desktop = desktop;
  }

  MelonLayoutScale getCurrentLayout(BuildContext context) {
    assert(MelonLayout.instance.desktop != null);
    final width = size(context).width;
    if (width >= MelonLayout.instance.desktop!) return MelonLayoutScale.desktop;
    if (MelonLayout.instance.tablet != null) {
      if (width >= MelonLayout.instance.tablet!) return MelonLayoutScale.tablet;
    }
    return MelonLayoutScale.mobile;
  }

  Size size(BuildContext context) => MediaQuery.of(context).size;

  MelonLayoutPlatform getCurrentPlatform(BuildContext context) {
    if (kIsWeb) return MelonLayoutPlatform.web;
    if (Platform.isIOS) return MelonLayoutPlatform.ios;
    if (Platform.isAndroid) return MelonLayoutPlatform.android;
    return MelonLayoutPlatform.desktop;
  }

  static Widget layout(
      {required BuildContext context,
      double? tablet,
      required double desktop,
      required Widget child}) {
    MelonLayout.instance.init(tablet: tablet, desktop: desktop);
    return child;
  }

  Future<String?> getPlatformVersion() {
    return MelonLayoutPluginPlatform.instance.getPlatformVersion();
  }
}
