import 'package:flutter/material.dart';

import '../widget/show_note_sheet.dart';

void showmodalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      context: context,
      builder: (context) {
        return const AddNoteSheet();
      },
    );
  }