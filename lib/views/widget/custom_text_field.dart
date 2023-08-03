import 'package:flutter/material.dart';
import 'package:note_app/app%20constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.maxLine = 1, required this.hintText});
  final int? maxLine;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      maxLines: maxLine,
      cursorColor: AppColor.primaryColor,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColor.primaryColor),
          enabledBorder: customBorder(),
          focusedBorder: customBorder(AppColor.primaryColor)),
    );
  }

  OutlineInputBorder customBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white ),
    );
  }
}