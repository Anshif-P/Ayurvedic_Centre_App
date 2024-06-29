import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class HomeCardWidget extends StatelessWidget {
  final String text;
  final String treatmentName;
  final String date;
  final String name;
  final int index;

  const HomeCardWidget(
      {super.key,
      required this.index,
      required this.date,
      required this.name,
      required this.text,
      required this.treatmentName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: AppColor.extraLightGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              '${index.toString()} .',
                              style: AppText.xLarge,
                            ),
                          )),
                      Expanded(
                        flex: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text,
                              style: AppText.xLarge,
                            ),
                            Text(
                              treatmentName,
                              style: AppText.defaultGreen,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range,
                                  size: 18,
                                  color: AppColor.redColor,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  date,
                                  style: AppText.defaultGrey,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Icon(
                                  Icons.group_outlined,
                                  size: 18,
                                  color: AppColor.redColor,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  name,
                                  style: AppText.defaultGrey,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                              flex: 8,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'View Booking details',
                                    style: AppText.defaultDark,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColor.primaryColor,
                                    size: 27,
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
