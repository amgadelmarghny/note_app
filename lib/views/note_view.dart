import 'package:flutter/material.dart';
import 'package:note_app/views/widget/note_view_body.dart';

import 'componant/modal_bottom_sheet.dart';

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
}
