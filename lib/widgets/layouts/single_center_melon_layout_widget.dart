import 'package:flutter/material.dart';
import 'package:melon_layout/widgets/layouts/layout_widget.dart';

class SingleCenterMelonLayoutWidget extends LayoutWidget {
  final double? maxWidth;

  const SingleCenterMelonLayoutWidget(
      {super.key, required super.body, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            child: body,
          ),
        )
      ],
    );
  }
}
