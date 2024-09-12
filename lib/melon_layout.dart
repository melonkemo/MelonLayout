import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'melon_layout_platform_interface.dart';

export 'widgets/melon_layout_scaffold.dart';

enum MelonLayoutScale { mobile, tablet, desktop }

enum MelonLayoutPlatform { web, ios, android, desktop }

enum MelonLayoutType { singleCenter }


class MelonLayout {
  static final MelonLayout _instance = MelonLayout._internal();

  factory MelonLayout() {
    return _instance;
  }

  static MelonLayout get instance => _instance;

  static double get defaultDesktop => 700.00;

  static double get defaultTablet => 500.00;

  MelonLayout._internal();

  late BuildContext context;

  double? tablet;
  double? desktop;

  double dimension = 1.0;
  double mobileDimension = 1.0;
  double webDimension = 1.0;
  double desktopDimension = 1.0;

  void setup(
      {double? tablet,
      required double desktop,
      double dimension = 1.0,
      double mobileDimension = 1.0,
      double webDimension = 1.0,
      desktopDimension = 1.0}) {
    assert(dimension > 0.0);
    assert(mobileDimension > 0.0);
    assert(webDimension > 0.0);
    assert(desktopDimension > 0.0);

    this.tablet = tablet;
    this.desktop = desktop;
    this.dimension = dimension;
    this.mobileDimension = mobileDimension;
    this.webDimension = webDimension;
    this.desktopDimension = desktopDimension;
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

  double dt(double size) {
    if (kIsWeb) return (size * dimension) * webDimension;
    if (Platform.isIOS || Platform.isAndroid) {
      return (size * dimension) * mobileDimension;
    }
    if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return (size * dimension) * desktopDimension;
    }
    return size * dimension;
  }
}
