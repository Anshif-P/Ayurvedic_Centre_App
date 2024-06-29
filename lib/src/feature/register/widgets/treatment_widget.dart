import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class TreatmentsWidget extends StatelessWidget {
  final ValueNotifier<String> treatmentName;
  final ValueNotifier<int> numberOfMale;
  final ValueNotifier<int> numberOfFemale;

  const TreatmentsWidget(
      {super.key,
      required this.numberOfFemale,
      required this.numberOfMale,
      required this.treatmentName});

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
                        child: ValueListenableBuilder(
                          valueListenable: treatmentName,
                          builder: (context, value, child) => Text(
                            treatmentName.value,
                            style: AppText.xLarge,
                          ),
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
                      ValueListenableBuilder(
                        valueListenable: numberOfMale,
                        builder: (context, value, child) => Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 33,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            numberOfMale.value.toString(),
                            style: AppText.defaultGreen,
                          ),
                        ),
                      ),
                      Text(
                        'Female',
                        style: AppText.defaultGreen,
                      ),
                      const SizedBox(width: 10),
                      ValueListenableBuilder(
                        valueListenable: numberOfFemale,
                        builder: (context, value, child) => Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 33,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: Text(
                            numberOfFemale.value.toString(),
                            style: AppText.defaultGreen,
                          ),
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
