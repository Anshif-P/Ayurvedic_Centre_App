import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';

class PaymentOptionsWidget extends StatelessWidget {
  final ValueNotifier<String?> selectedValueNotifier;

  const PaymentOptionsWidget({super.key, required this.selectedValueNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedValueNotifier,
      builder: (context, selectedValue, child) {
        return Row(
          children: [
            Expanded(
              child: RadioListTile<String>(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  'Cash',
                  style: AppText.defaultDark,
                ),
                value: 'option 1',
                groupValue: selectedValue,
                onChanged: (value) {
                  selectedValueNotifier.value = value;
                },
                activeColor: AppColor.primaryColor,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  'Card',
                  style: AppText.defaultDark,
                ),
                value: 'option 2',
                groupValue: selectedValue,
                onChanged: (value) {
                  selectedValueNotifier.value = value;
                },
                activeColor: AppColor.primaryColor,
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  'UPI',
                  style: AppText.defaultDark,
                ),
                value: 'option 3',
                groupValue: selectedValue,
                onChanged: (value) {
                  selectedValueNotifier.value = value;
                },
                activeColor: AppColor.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
