import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/authentication/view/screen_login.dart';
import 'package:noviindus_machine_task/src/feature/authentication/view/screen_splash.dart';
import 'package:noviindus_machine_task/src/feature/register/view/screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenHome(),
    );
  }
}
