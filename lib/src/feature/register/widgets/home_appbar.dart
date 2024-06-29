import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/util/validation/form_validation.dart';
import 'package:noviindus_machine_task/src/widgets/text_feild_widget.dart';

class HomeAppBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  final double screenHeight;

  HomeAppBar({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 203),
      height: screenHeight * 0.24,
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
                        validator: (value) => Validations.emtyValidation(value),
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
                          borderRadius: BorderRadius.all(Radius.circular(6))),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
