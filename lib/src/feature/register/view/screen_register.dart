import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/feature/register/controller/register_provider.dart';
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
import 'package:provider/provider.dart';

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
  String selectedBranch = 'Edappali';
  String selectedLocation = 'Kerala';
  final ValueNotifier<String> selectedTreatment =
      ValueNotifier('Herbal Face Pack');
  final ValueNotifier<String> numberOfMale = ValueNotifier('0');
  final ValueNotifier<String> numberOfFemale = ValueNotifier('0');
  String selectedHour = '10';
  String selectedMinutes = '0.0';

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
                    controller: whatsappNumberController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Whatsapp Number',
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hintText: 'Enter your full address',
                    controller: addressController,
                    validator: (value) => Validations.emtyValidation(value),
                    text: 'Address',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropDownWidget(
                    onPressed: (value) {
                      selectedLocation = value;
                    },
                    hintText: 'Choose your location',
                    text: 'Location',
                    isLocation: true,
                  ),
                  const SizedBox(height: 20),
                  Consumer<RegisterProvider>(
                    builder: (context, value, child) => DropDownWidget(
                      onPressed: (value) {
                        selectedBranch = value;
                      },
                      branches: value.branches,
                      hintText: 'Select the branch',
                      text: 'Branch',
                      isBranch: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Treatments',
                    style: AppText.defaultDark,
                  ),
                  const SizedBox(height: 10),
                  TreatmentsWidget(
                    numberOfFemale: numberOfFemale,
                    numberOfMale: numberOfMale,
                    treatmentName: selectedTreatment,
                  ),
                  const SizedBox(height: 10),
                  ButtonWidget(
                      colorCheck: true,
                      onpressFunction: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertdialogWidget(
                                onPress: (value) {
                                  print(value);
                                  selectedTreatment.value = value;
                                },
                                onPressFemale: (value) {
                                  print(value);
                                  numberOfFemale.value = value.toString();
                                },
                                onPressMale: (value) {
                                  print(value);
                                  numberOfMale.value = value.toString();
                                },
                              );
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
                        onPressed: (value) {
                          selectedHour = value;
                        },
                        hintText: 'Hour',
                        text: 'Treatment Time',
                        isHour: true,
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: DropDownWidget(
                        onPressed: (value) {
                          selectedMinutes = value;
                        },
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
