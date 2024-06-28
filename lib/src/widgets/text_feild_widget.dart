import 'package:flutter/material.dart';
import 'package:noviindus_machine_task/src/util/constance/colors.dart';
import 'package:noviindus_machine_task/src/util/constance/text_style.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? text;
  final bool textVisibility;
  final FormFieldValidator validator;
  final bool isColorGrey;
  bool isObscure = true;

  TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator,
      this.text,
      this.isObscure = false,
      this.textVisibility = false,
      this.isColorGrey = true});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isColorGrey
              ? Text(
                  widget.text!,
                  style: AppText.defaultDark,
                )
              : const SizedBox(),
          SizedBox(
            height: widget.isColorGrey ? 8 : 0,
          ),
          Container(
            color: widget.isColorGrey ? AppColor.extraLightGrey : Colors.white,
            child: TextFormField(
              onEditingComplete: () {
                FocusScope.of(context).nextFocus();
              },
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.isObscure,
              decoration: InputDecoration(
                isDense: true,
                constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: widget.isColorGrey
                    ? null
                    : const Icon(
                        Icons.search,
                        size: 25,
                        color: AppColor.grey,
                      ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: widget.textVisibility
                    ? IconButton(
                        icon: Icon(widget.isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            widget.isObscure = !widget.isObscure;
                          });
                        },
                      )
                    : null,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                hintText: widget.hintText,
                hintStyle: AppText.mediumGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
