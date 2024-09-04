import 'package:flutter/widgets.dart';
import 'package:melon_layout/melon_layout.dart';

extension MelonLayoutBuildContextExtension on BuildContext {
  Size get layout => MediaQuery.of(this).size;

  T flex<T>({T? mobile, T? tablet, T? desktop}) =>
      MelonLayout.flex(this, mobile: mobile, tablet: tablet, desktop: desktop);

  double dt(double value) => MelonLayout.instance.dt(value);
}

extension MelonLayoutIntegerExtension on int {
  int get dt => MelonLayout.instance.dt(toDouble()).toInt();
}

extension MelonLayoutDoubleExtension on double {
  double get dt => MelonLayout.instance.dt(this);
}