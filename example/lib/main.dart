import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:melon_layout/melon_layout.dart';
import 'package:melon_layout/extensions/melon_layout_extension.dart';

void main() {
  MelonLayout.instance.setup(desktop: MelonLayout.defaultDesktop,tablet: MelonLayout.defaultTablet);
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
      home: Scaffold(

        appBar: AppBar(
          title: Text(
              "Running ${MelonLayout.flex<double>(context, mobile: context.layout.width, tablet: 500, desktop: 1000)}"),
          //'Plugin example app ${MelonLayout.state<String>(context, mobile: "A", tablet: "B", desktop: "C")}'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                  '${MelonLayout.flex<double>(context, mobile: context.layout.width, tablet: 500, desktop: 1000)}'),
              Text(
                  '${context.flex<double>(mobile: context.layout.width, tablet: 500, desktop: 1000)}'),
            ],
          ),
        ),
      ),
    );
  }
}
