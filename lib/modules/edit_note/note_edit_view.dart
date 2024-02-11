import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/modules/edit_note/note_edit_view_body.dart';

class NoteEditView extends StatelessWidget {
  const NoteEditView({super.key, required this.noteModel});
final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: NoteEditViewBody(noteModel: noteModel,),
    );
  }
}