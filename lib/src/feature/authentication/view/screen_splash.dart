import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/assets_path/assets.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.splashBackgroundImage),
                fit: BoxFit.cover)),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.appLogo)))),
      ),
    );
  }
}
