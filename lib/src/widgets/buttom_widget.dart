import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class ButtonWidget extends StatelessWidget {
  final bool paymentButtonCheck;
  final String text;
  final VoidCallback onpressFunction;
  final bool loadingCheck;
  final bool reviewButtonCheck;
  const ButtonWidget({
    super.key,
    this.reviewButtonCheck = false,
    this.paymentButtonCheck = false,
    required this.onpressFunction,
    required this.text,
    this.loadingCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: reviewButtonCheck ? 35 : 48,
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                const Size.fromWidth(double.maxFinite)),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
          ),
          onPressed: onpressFunction,
          child: loadingCheck
              ? Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(
                    strokeWidth: 5,
                    color: Colors.white,
                  ))
              : Text(
                  text,
                  style: AppText.mediumLight,
                ),
        ));
  }
}
