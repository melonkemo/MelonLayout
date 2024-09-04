import 'package:flutter/widgets.dart';
import 'package:melon_layout/melon_layout.dart';

extension MelonLayoutBuildContext on BuildContext {
  Size get layout =>
      MediaQuery
          .of(this)
          .size;

  T flex<T>({T? mobile, T? tablet, T? desktop}) =>
      MelonLayout.flex(this, mobile: mobile, tablet: tablet, desktop: desktop);
}
