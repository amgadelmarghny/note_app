import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 40,
        right: 16,
        left: 16,
      ),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Title',
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            hintText: 'Content',
            maxLine: 5,
          )
        ],
      ),
    );
  }
}
