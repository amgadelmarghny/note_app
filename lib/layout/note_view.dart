import 'package:flutter/material.dart';
import 'package:note_app/layout/note_view_body.dart';

import '../modules/bottom_sheet/modal_bottom_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
