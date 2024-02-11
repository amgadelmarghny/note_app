import 'package:flutter/material.dart';
import 'package:note_app/shared/app_constants/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLine = 1,
      this.hintText,
      this.onSaved,
      this.onChange,
      this.textEditingController});
  final int? maxLine;
  final String? hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final TextEditingController? textEditingController;
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
      onChanged: onChange,
      onSaved: onSaved,
      maxLines: maxLine,
      controller: textEditingController,
      cursorColor: AppColor.kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColor.kPrimaryColor),
        border: customBorder(),
        focusedBorder: customBorder(color: AppColor.kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder customBorder({color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
