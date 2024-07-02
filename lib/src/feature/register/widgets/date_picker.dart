import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePickerWidget extends StatelessWidget {
  final String text;
  final String hintText;
  void Function(DateTime) onPressed;
  final ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);

  DatePickerWidget(
      {super.key,
      required this.hintText,
      required this.text,
      required this.onPressed});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = DateTime(picked.year, picked.month, picked.day);
      onPressed(selectedDate.value!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppText.defaultDark),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
          valueListenable: selectedDate,
          builder: (context, value, child) => GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              height: 55,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColor.extraLightGrey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.grey)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value == null
                          ? hintText
                          : DateFormat('yyyy-MM-dd').format(value),
                      style: AppText.defaultDark,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: AppColor.primaryColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
