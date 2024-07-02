import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/register_provider.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/dropdown_widget.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';
import 'package:provider/provider.dart';

class AlertdialogWidget extends StatelessWidget {
  final Function(String) onPress;
  final Function(int) onPressMale;
  final Function(int) onPressFemale;
  final ValueNotifier<int> maleCount;
  final ValueNotifier<int> femaleCount;
  final ValueNotifier<String> selectedTreatment;

  const AlertdialogWidget({
    super.key,
    required this.onPress,
    required this.onPressFemale,
    required this.onPressMale,
    required this.maleCount,
    required this.femaleCount,
    required this.selectedTreatment,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      content: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<RegisterProvider>(
              builder: (context, value, child) => DropDownWidget(
                selectedTreatment: selectedTreatment,
                onPressed: onPress,
                branches: value.branches,
                hintText: 'Choose preferred treatment',
                text: 'Choose Treatment',
                isTreatment: true,
                treatments: value.treatments,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Add Patients',
              style: AppText.defaultDark,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: AppColor.grey),
                      color: AppColor.extraLightGrey,
                    ),
                    child: Text(
                      'Male',
                      style: AppText.defaultDark,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.primaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            if (maleCount.value > 0) {
                              maleCount.value--;
                              onPressMale(maleCount.value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      ValueListenableBuilder<int>(
                        valueListenable: maleCount,
                        builder: (context, value, child) => Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: AppColor.grey),
                            color: Colors.white,
                          ),
                          child: Text(value.toString()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.primaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            maleCount.value++;
                            onPressMale(maleCount.value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: AppColor.grey),
                      color: AppColor.extraLightGrey,
                    ),
                    child: Text(
                      'Female',
                      style: AppText.defaultDark,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.primaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            if (femaleCount.value > 0) {
                              femaleCount.value--;
                              onPressFemale(femaleCount.value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      ValueListenableBuilder<int>(
                        valueListenable: femaleCount,
                        builder: (context, value, child) => Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            border: Border.all(color: AppColor.grey),
                            color: Colors.white,
                          ),
                          child: Text(value.toString()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColor.primaryColor,
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            femaleCount.value++;
                            onPressFemale(femaleCount.value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        ButtonWidget(
          onpressFunction: () {
            // Perform save action
            Navigator.of(context).pop(); // Close the dialog
          },
          text: "Save",
        ),
      ],
    );
  }
}
