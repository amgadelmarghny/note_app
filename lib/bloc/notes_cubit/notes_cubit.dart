import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/app%20constants/app_string.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchNote() {
    try {
      var noteBox = Hive.box<NoteModel>(AppString.kNotesBox);
      emit(NotesSuccessfull(notesList: noteBox.values.toList()));
    } catch (e) {
      emit(NotesFailure(errMessage: e.toString()));
    }
  }
}
