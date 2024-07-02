import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

class DropDownWidget extends StatelessWidget {
  final String text;
  final String hintText;
  final bool isLocation;
  final bool isBranch;
  final bool isHour;
  final bool isMinutes;
  final bool isTreatment;
  final List<String>? branches;
  final List<String>? treatments;
  final ValueNotifier<String> selectedBranch = ValueNotifier('Edappali');
  final ValueNotifier<String> selectedState = ValueNotifier('Kerala');
  final ValueNotifier<String> selectedHour = ValueNotifier('10');
  final ValueNotifier<String> selectedMinute = ValueNotifier('0');
  final ValueNotifier<String>? selectedTreatment;

  final Function(String) onPressed;

  DropDownWidget({
    Key? key,
    required this.onPressed,
    required this.hintText,
    required this.text,
    this.selectedTreatment,
    this.isLocation = false,
    this.isBranch = false,
    this.isHour = false,
    this.isMinutes = false,
    this.isTreatment = false,
    this.branches,
    this.treatments,
  }) : super(key: key);

  final List<String> hours =
      List<String>.generate(12, (index) => (index + 1).toString());
  final List<String> minutes =
      List<String>.generate(60, (index) => (index).toString());

  final List<String> states = [
    'Kerala',
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
  ];

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> selectedNotifier;

    if (isLocation) {
      selectedNotifier = selectedState;
    } else if (isBranch) {
      selectedNotifier = selectedBranch;
    } else if (isHour) {
      selectedNotifier = selectedHour;
    } else if (isMinutes) {
      selectedNotifier = selectedMinute;
    } else if (isTreatment) {
      selectedNotifier = selectedTreatment!;
    } else {
      selectedNotifier = selectedTreatment!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppText.defaultDark),
        const SizedBox(height: 6),
        Container(
          height: 55,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColor.extraLightGrey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.grey),
          ),
          child: ValueListenableBuilder(
            valueListenable: selectedNotifier,
            builder: (context, value, child) => DropdownButton<String>(
              elevation: 0,
              isExpanded: true,
              underline: const SizedBox(),
              menuMaxHeight: double.maxFinite,
              icon: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.primaryColor,
                  size: 30,
                ),
              ),
              padding: const EdgeInsets.only(left: 10, top: 7),
              hint: Text(hintText),
              itemHeight: 60,
              borderRadius: BorderRadius.circular(7),
              value: value,
              items: _getDropdownItems(),
              onChanged: (String? newValue) {
                selectedNotifier.value = newValue!;
                onPressed(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropdownItems() {
    if (isLocation) {
      return states.map((String state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(
            state.length > 12 ? '${state.substring(0, 12)}..' : state,
            style: AppText.defaultDark,
          ),
        );
      }).toList();
    } else if (isBranch) {
      return branches!.map((String branch) {
        return DropdownMenuItem<String>(
          value: branch,
          child: Text(branch, style: AppText.defaultDark),
        );
      }).toList();
    } else if (isHour) {
      return hours.map((String hour) {
        return DropdownMenuItem<String>(
          value: hour,
          child: Text(hour, style: AppText.defaultDark),
        );
      }).toList();
    } else if (isMinutes) {
      return minutes.map((String minute) {
        return DropdownMenuItem<String>(
          value: minute,
          child:
              Text(minute == '0' ? '0:0' : minute, style: AppText.defaultDark),
        );
      }).toList();
    } else if (isTreatment) {
      return treatments!.map((String treatment) {
        return DropdownMenuItem<String>(
          value: treatment,
          child: Text(treatment, style: AppText.defaultDark),
        );
      }).toList();
    } else {
      return [];
    }
  }
}
