import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/alertdialog.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/register_app_bar.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/date_picker.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/dropdown_widget.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/payment_option.dart';
import 'package:noviindus_machine_task/src/feature/register/widgets/treatment_widget.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:noviindus_machine_task/src/util/validation/form_validation.dart';
import 'package:noviindus_machine_task/src/widgets/buttom_widget.dart';
import 'package:noviindus_machine_task/src/widgets/text_feild_widget.dart';

// ignore: must_be_immutable
class ScreenRegister extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController dicountAmountController = TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();
  final TextEditingController treatmentDateController = TextEditingController();
  final ValueNotifier<String?> paymentOption = ValueNotifier(null);

  ScreenRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const RegisterPageAppBar(),
            const Divider(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView(
                children: [
                  TextFieldWidget(
                    hintText: 'Enter your full name',
                    controller: nameController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Name',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: 'Enter your Whatsapp number',
                    controller: nameController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Whatsapp Number',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: 'Enter your full address',
                    controller: nameController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Address',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownWidget(
                    hintText: 'Choose your location',
                    text: 'Location',
                    isLocation: true,
                  ),
                  const SizedBox(height: 20),
                  DropDownWidget(
                    hintText: 'Select the branch',
                    text: 'Branch',
                    isBranch: true,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Treatments',
                    style: AppText.defaultDark,
                  ),
                  const SizedBox(height: 10),
                  const TreatmentsWidget(),
                  const SizedBox(height: 10),
                  ButtonWidget(
                      colorCheck: true,
                      onpressFunction: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertdialogWidget();
                            });
                      },
                      text: '+ Add Treatments'),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: '',
                    controller: nameController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Total Amount',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: '',
                    controller: nameController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Discount Amount',
                  ),
                  const SizedBox(height: 20),
                  Text('Payment Option', style: AppText.defaultDark),
                  const SizedBox(height: 10),
                  PaymentOptionsWidget(selectedValueNotifier: paymentOption),
                  TextFieldWidget(
                      hintText: '',
                      controller: advanceAmountController,
                      validator: (value) => Validations.emtyValidation(value),
                      text: 'Advance Amount'),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: '',
                    controller: balanceAmountController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Balance Amount',
                  ),
                  const SizedBox(height: 20),
                  DatePickerWidget(
                    hintText: '',
                    text: 'Treatment Date',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: DropDownWidget(
                        hintText: 'Hour',
                        text: 'Treatment Time',
                        isHour: true,
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: DropDownWidget(
                        hintText: 'Hour',
                        text: 'Treatment Time',
                        isMinutes: true,
                      )),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ButtonWidget(onpressFunction: () {}, text: 'Save')
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
