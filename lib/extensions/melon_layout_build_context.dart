import 'package:flutter/widgets.dart';

extension MelonLayoutBuildContext on BuildContext {
  Size get layout => MediaQuery.of(this).size;
}
