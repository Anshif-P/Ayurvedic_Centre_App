import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/authentication/controller/auth_provider.dart';
import 'package:noviindus_machine_task/src/feature/authentication/view/screen_splash.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/get_patients_provider.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/register_provider.dart';
import 'package:noviindus_machine_task/src/resources/local/shared_pref_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefModel.instance.initSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatinetsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenSplash(),
      ),
    );
  }
}
