import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/authentication/view/screen_login.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_home.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:noviindus_machine_task/src/util/assets_path/assets.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    loginCheck();
  }

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

  void loginCheck() async {
    await Future.delayed(const Duration(seconds: 3));
    final token = SharedPrefModel.instance.getData('token');
    if (token != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const ScreenHome()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenLogin()));
    }
  }
}
