import 'package:flutter/material.dart';

import 'layout_widget.dart';

class MenuMelonLayoutWidget extends LayoutWidget {
  final Widget menu;
  final double menuWidth;

  const MenuMelonLayoutWidget({
    super.key,
    required super.body,
    this.menuWidth = 200,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: menuWidth,
          child: menu,
        ),
        Expanded(
          child: body,
        ),
      ],
    );
  }
}
