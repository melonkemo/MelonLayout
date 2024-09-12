import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MelonLayoutScaffold extends StatelessWidget {
  final Color statusBarColor;
  final Color systemNavigationBarColor;
  final Brightness statusBarIconBrightness;
  final Brightness systemNavigationBarIconBrightness;
  final bool extendBodyBehindAppBar;

  final Widget body;
  final List<Widget>? children;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  const MelonLayoutScaffold({
    super.key,
    this.statusBarColor = Colors.white,
    this.systemNavigationBarColor = Colors.transparent,
    this.statusBarIconBrightness = Brightness.dark,
    this.systemNavigationBarIconBrightness = Brightness.dark,
    this.extendBodyBehindAppBar = false,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (backgroundColor != null) Container(color: backgroundColor),
        ...?children,
        scaffold(context),
      ],
    );
  }

  Widget scaffold(BuildContext context) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          systemNavigationBarColor: systemNavigationBarColor,
          statusBarIconBrightness: statusBarIconBrightness,
          systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        ),
        child: Scaffold(
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          appBar: appBar,
          backgroundColor: backgroundColor == null ? Colors.white :Colors.transparent,
          body: body,
          //bottomSheet: bottomSheet,
        ),
      );
}
