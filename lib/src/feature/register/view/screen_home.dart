import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/util/validation/form_validation.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';
import 'package:noviindus_machine_task/src/widgets/text_feild_widget.dart';

class ScreenHome extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 55,
          child: ButtonWidget(onpressFunction: () {}, text: 'Register Now'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(minHeight: 203),
              height: screenHight * 0.24,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                        Icon(Icons.notifications_none)
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 54,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 6,
                            child: TextFieldWidget(
                                hintText: 'Search for treatments',
                                controller: searchController,
                                validator: (value) =>
                                    Validations.emtyValidation(value),
                                isColorGrey: false),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6))),
                              child: Text(
                                'Search',
                                style: AppText.defaultLight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Sort by :',
                            style: AppText.mediumdark,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date',
                                    style: AppText.defaultDark,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppColor.primaryColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.separated(
                  itemBuilder: (context, index) {
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              '1 .',
                                              style: AppText.xLarge,
                                            ),
                                          )),
                                      Expanded(
                                        flex: 8,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                              flex: 1, child: SizedBox()),
                                          Expanded(
                                              flex: 8,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'View Booking details',
                                                    style: AppText.defaultDark,
                                                  ),
                                                  const Icon(
                                                    Icons.keyboard_arrow_right,
                                                    color:
                                                        AppColor.primaryColor,
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
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                  itemCount: 8),
            ))
          ],
        ),
      ),
    );
  }
}
