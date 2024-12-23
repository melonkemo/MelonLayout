import 'package:flutter/material.dart';
import 'package:melon_layout/extensions/melon_layout_extension.dart';

class MelonBarWidget {
  static double get height => 56.0;

  static PreferredSizeWidget widget(
    BuildContext context, {
    Widget? body,
    double? height,
    bool isBlur = false,
    Color? tintColor,
  }) =>
      PreferredSize(
        preferredSize: Size.fromHeight(height ?? MelonBarWidget.height),
        child: Container(
          height: height ?? MelonBarWidget.height,
          color: tintColor,
          child: body ?? Container(),
        ).blur(isDisabled: !isBlur,height: height ?? MelonBarWidget.height),
      );

  static PreferredSizeWidget full(
    BuildContext context, {
    Widget? body,
    double? height,
    bool isBlur = false,
    Color? tintColor,
  }) =>
      widget(context,
          height: height, body: body, isBlur: isBlur, tintColor: tintColor);

  static PreferredSizeWidget appBar(
    BuildContext context, {
    Widget? leadingWidget,
    Widget? trailingWidget,
    Widget? centerWidget,
    double? height,
    bool isBlur = false,
    Color? tintColor,
  }) =>
      full(
        context,
        height: height,
        body: Stack(
          children: [
            if (centerWidget != null)
              Align(
                alignment: Alignment.center,
                child: centerWidget,
              ),
            if (leadingWidget != null)
              Align(
                alignment: Alignment.centerLeft,
                child: leadingWidget,
              ),
            if (trailingWidget != null)
              Align(
                alignment: Alignment.centerRight,
                child: trailingWidget,
              ),
          ],
        ),
        isBlur: isBlur,
        tintColor: tintColor,
      );

  static PreferredSizeWidget bottomBar(
    BuildContext context, {
    Widget? leadingWidget,
    Widget? trailingWidget,
    Widget? centerWidget,
    double? height,
    bool isBlur = false,
    Color? tintColor,
  }) =>
      full(
        context,
        height: height != null
            ? height + MediaQuery.of(context).padding.bottom
            : height,
        body: Stack(
          children: [
            if (centerWidget != null)
              Align(
                alignment: Alignment.center,
                child: centerWidget,
              ),
            if (leadingWidget != null)
              Align(
                alignment: Alignment.centerLeft,
                child: leadingWidget,
              ),
            if (trailingWidget != null)
              Align(
                alignment: Alignment.centerRight,
                child: trailingWidget,
              ),
          ],
        ),
        isBlur: isBlur,
        tintColor: tintColor,
      );
}
