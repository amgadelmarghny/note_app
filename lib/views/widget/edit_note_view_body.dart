import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomTextField(
            hintText: 'Title',
          ),
          SizedBox(
            height: 50,
          ),
          CustomTextField(
            hintText: 'context',
            maxLine: 5,
          ),
        ],
      )),
    );
  }
}
