import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'melon_layout_platform_interface.dart';
export 'extensions/melon_layout_build_context.dart';

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

  static T flex<T>(BuildContext context, {T? mobile, T? tablet, T? desktop}) {
    assert(!(mobile == null && tablet == null && desktop == null));
    switch (MelonLayout.instance.getCurrentLayout(context)) {
      case MelonLayoutScale.desktop:
        return (desktop ?? (tablet ?? mobile))!;
      case MelonLayoutScale.tablet:
        return (tablet ?? (desktop ?? mobile))!;
      default:
        return (mobile ?? (tablet ?? desktop))!;
    }
  }

  MelonLayoutScale getCurrentLayout(BuildContext context) {
    assert(desktop != null);
    final width = size(context).width;
    if (width >= desktop!) return MelonLayoutScale.desktop;
    if (tablet != null) {
      if (width >= tablet!) return MelonLayoutScale.tablet;
    }
    return MelonLayoutScale.mobile;
  }

  static Size size(BuildContext context) => MediaQuery.of(context).size;

  MelonLayoutPlatform getCurrentPlatform(BuildContext context) {
    if (kIsWeb) return MelonLayoutPlatform.web;
    if (Platform.isIOS) return MelonLayoutPlatform.ios;
    if (Platform.isAndroid) return MelonLayoutPlatform.android;
    return MelonLayoutPlatform.desktop;
  }

  static Widget blueprint(
      {required BuildContext context,
      required Widget Function(MelonLayout layout) child}) {
    return child.call(MelonLayout.instance);
  }

  Future<String?> getPlatformVersion() {
    return MelonLayoutPluginPlatform.instance.getPlatformVersion();
  }
}
