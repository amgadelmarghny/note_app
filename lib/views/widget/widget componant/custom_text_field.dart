import 'package:flutter/material.dart';
import 'package:note_app/app%20constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.maxLine = 1, required this.hintText, this.onSaved});
  final int? maxLine;
  final String hintText;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLine,
      cursorColor: AppColor.kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColor.kPrimaryColor),
        border: customBorder(),
        focusedBorder: customBorder(AppColor.kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder customBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
