import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

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
                              '1 .',
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
                              'Vikram Singh',
                              style: AppText.xLarge,
                            ),
                            Text(
                              'Couple Combo Package (Rejuven)',
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
                                  '31/01/2024',
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
                                  'Jithesh',
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
