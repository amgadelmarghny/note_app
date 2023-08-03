import 'package:flutter/material.dart';
import 'package:note_app/views/widget/note_edit_view_body.dart';

class NoteEditView extends StatelessWidget {
  const NoteEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteEditViewBody(),
    );
  }
}