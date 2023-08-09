import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/app%20constants/app_string.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xffCF8BA9);
  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());

    try {
      var noteBox = Hive.box<NoteModel>(AppString.kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccessfull());
    } catch (e) {
      emit(AddNotefailure(errMessage: e.toString()));
    }
  }
}
