import 'package:flutter/widgets.dart';
import 'package:melon_layout/melon_layout.dart';
import 'dart:ui' as ui;

extension MelonLayoutBuildContextExtension on BuildContext {
  Size get layout => MediaQuery.of(this).size;

  T flex<T>({T? mobile, T? tablet, T? desktop}) =>
      MelonLayout.flex(this, mobile: mobile, tablet: tablet, desktop: desktop);

  double dt(double value) => MelonLayout.instance.dt(value);

  Size get prxSize => Size(layout.width, layout.height * 0.78);
}

extension MelonLayoutIntegerExtension on int {
  int get dt => MelonLayout.instance.dt(toDouble()).toInt();
}

extension MelonLayoutDoubleExtension on double {
  double get dt => MelonLayout.instance.dt(this);
}

extension MelonLayoutWidgetExtension on Widget {
  Widget blur(
          {bool isDisabled = false,
          double sigmaX = 12.0,
          double sigmaY = 12.0}) =>
      !isDisabled
          ? ClipRRect(
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: sigmaX,
                  sigmaY: sigmaY,
                ),
                child: this,
              ),
            )
          : this;
}
