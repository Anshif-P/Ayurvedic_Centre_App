import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/assets_path/assets.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/util/validation/form_validation.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';
import 'package:noviindus_machine_task/src/widgets/text_feild_widget.dart';

class ScreenLogin extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 215),
            alignment: Alignment.center,
            height: screenHight * 0.25,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.loginBackgroundImage),
                    fit: BoxFit.cover)),
            child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.appLogo)))),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Login Or Register To Book Your Appointments',
                    style: AppText.largeDark,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    hintText: 'Enter your email',
                    controller: emailController,
                    validator: (value) => Validations.emailValidation(value),
                    text: 'Email',
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFieldWidget(
                    hintText: 'Enter password',
                    controller: passwordController,
                    validator: (value) => Validations.emailValidation(value),
                    text: 'Password',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonWidget(onpressFunction: () {}, text: 'Login'),
                  const SizedBox(
                    height: 130,
                  ),
                  Text.rich(TextSpan(
                    text:
                        'By creating or logging into an account you are agreeing with our ',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: const TextStyle(color: AppColor.blueColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: const TextStyle(color: AppColor.blueColor),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  )),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
