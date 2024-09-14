import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:melon_layout/melon_layout.dart';
import 'package:melon_layout/extensions/melon_layout_extension.dart';
import 'package:melon_layout/widgets/layouts/menu_melon_layout_widget.dart';
import 'package:melon_layout/widgets/layouts/single_center_melon_layout_widget.dart';

void main() {
  MelonLayout.instance.setup(
      desktop: MelonLayout.defaultDesktop,
      tablet: MelonLayout.defaultTablet,
      mobileDimension: 1.0,
      mobileWebDimension: 0.95,
      webDimension: 0.85);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _melonLayoutPlugin = MelonLayout();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _melonLayoutPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: _layout(context),
      home: _layout(context),
    );
  }

  Widget _layout(BuildContext context) {
    // return MenuMelonLayoutWidget(
    //   body: _body(context),
    //   menu: Container(color: Colors.red),
    //   menuWidth: 200,
    // );
    // return SingleCenterMelonLayoutWidget(
    //   body: _body(context),
    //   maxWidth: 700,
    // );
    return MelonLayoutScaffold(
      backgroundColor: Colors.lime,
      extendBodyBehindAppBar: true,
      //appBar: MelonAppbarWidget.widget(context),
      appBar: MelonBarWidget.appBar(
          height: context.flex<double>(mobile: 56.0, desktop: 50.0).dt,
          context,
          isBlur: true,
          tintColor: Colors.greenAccent.withOpacity(0.5),
          leadingWidget: const DrawerButton()),
      drawer: const Drawer(),
      bottomNavigationBar: MelonBarWidget.bottomBar(context,
          height: context.flex<double>(mobile: 56.0, desktop: 50.0).dt,
          isBlur: true,
          tintColor: Colors.purpleAccent.withOpacity(0.5)),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //       "Running ${MelonLayout.flex<double>(context, mobile: context.layout.width, tablet: 500, desktop: 1000)}"),
      //   //'Plugin example app ${MelonLayout.state<String>(context, mobile: "A", tablet: "B", desktop: "C")}'),
      // ),
      body: SingleCenterMelonLayoutWidget(
        body: _body(context),
        maxWidth: 700,
      ),
      // body: MenuMelonLayoutWidget(
      //   body: _body(context),
      //   menu: Container(color: Colors.red),
      //   menuWidth: 250,
      // ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      width: context.flex<double>(mobile: context.layout.width, desktop: 700),
      color: Colors.lightBlue,
      padding: EdgeInsets.only(
          top: MelonBarWidget.height, bottom: MelonBarWidget.height),
      child: Center(
        child: Column(
          children: [
            Text(
              '${MelonLayout.flex<double>(context, mobile: context.layout.width, tablet: 500, desktop: 1000)}',
              style: TextStyle(fontSize: 16.0.dt),
            ),
            Text(
              "ยินดีต้อนรับกลับ ${defaultTargetPlatform}",
              style: TextStyle(fontSize: 32.dt, fontWeight: FontWeight.bold),
            ),
            Text(
                '${MediaQuery.of(context).padding.bottom} ${MediaQuery.of(context).viewInsets.bottom} ${MediaQuery.of(context).viewPadding.bottom} ${context.flex<double>(mobile: context.layout.width, tablet: 500, desktop: 1000)}'),
          ],
        ),
      ),
    );
  }
}
