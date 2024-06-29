import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/util/validation/form_validation.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';
import 'package:noviindus_machine_task/src/widgets/text_feild_widget.dart';

class AlertdialogWidget extends StatelessWidget {
  const AlertdialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController treatmentController = TextEditingController();
    return AlertDialog(
      surfaceTintColor: Colors.white,
      content: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              hintText: 'Choose preferred treatment',
              controller: treatmentController,
              validator: (value) => Validations.emtyValidation(value),
              text: 'choose Treatment',
              isColorGrey: true,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          border: Border.all(color: AppColor.grey),
                          color: AppColor.extraLightGrey),
                      child: Text(
                        'Male',
                        style: AppText.defaultDark,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: AppColor.grey),
                              color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ))
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
                          border: Border.all(color: AppColor.grey),
                          color: AppColor.extraLightGrey),
                      child: Text(
                        'Female',
                        style: AppText.defaultDark,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              border: Border.all(color: AppColor.grey),
                              color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ))
              ],
            )
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
        )
      ],
    );
  }
}
