import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MelonLayoutScaffold extends StatelessWidget {
  final Color statusBarColor;
  final Color systemNavigationBarColor;
  final Brightness statusBarIconBrightness;
  final Brightness systemNavigationBarIconBrightness;
  final bool? extendBodyBehindAppBar;
  final bool? extendBodyBehindBottomNavigationBar;
  final Drawer? drawer;

  final Widget body;
  final List<Widget>? children;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;

  MelonLayoutScaffold({
    super.key,
    this.statusBarColor = Colors.white,
    this.systemNavigationBarColor = Colors.transparent,
    this.statusBarIconBrightness = Brightness.dark,
    this.systemNavigationBarIconBrightness = Brightness.dark,
    this.extendBodyBehindAppBar,
    this.extendBodyBehindBottomNavigationBar,
    required this.body,
    this.drawer,
    this.bottomSheet,
    this.appBar,
    this.backgroundColor,
    this.children,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (backgroundColor != null) Container(color: backgroundColor),
        ...?children,
        scaffold(context),
        //if (bottomNavigationBar != null) _bottomNavigationBar(context),
      ],
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: bottomNavigationBar!,
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget scaffold(BuildContext context) =>
      AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor,
          systemNavigationBarColor: systemNavigationBarColor,
          statusBarIconBrightness: statusBarIconBrightness,
          systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        ),
        child: Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: extendBodyBehindAppBar ?? (appBar != null),
          appBar: appBar,
          backgroundColor:
              backgroundColor == null ? Colors.white : Colors.transparent,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          extendBody: extendBodyBehindBottomNavigationBar ??
              (bottomNavigationBar != null),
          drawer: drawer,
          bottomSheet: bottomSheet,
        ),
      );
}
