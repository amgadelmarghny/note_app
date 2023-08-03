import 'package:flutter/material.dart';
import 'package:note_app/views/widget/note_view_body.dart';

import 'widget/show_note_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NoteViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showmodalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showmodalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (context) {
          return const AddNoteSheet();
        });
  }
}
