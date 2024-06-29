import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class TreatmentsWidget extends StatelessWidget {
  const TreatmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          color: AppColor.extraLightGrey),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      '1 .',
                      style: AppText.xLarge,
                    ),
                  ],
                )),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          'Couple Combo package i',
                          style: AppText.xLarge,
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: AppColor.redColor,
                          )),
                    ],
                  )),
                  const SizedBox(height: 10),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Male',
                        style: AppText.defaultGreen,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 33,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          '2',
                          style: AppText.defaultGreen,
                        ),
                      ),
                      Text(
                        'Female',
                        style: AppText.defaultGreen,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        width: 40,
                        height: 33,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Text(
                          '2',
                          style: AppText.defaultGreen,
                        ),
                      ),
                      const Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColor.primaryColor,
                      )
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
