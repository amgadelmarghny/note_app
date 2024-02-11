import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/shared/app_constants/app_string.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
 
  List<NoteModel>? noteList;
  fetchNote() {
    var noteBox = Hive.box<NoteModel>(AppString.kNotesBox);
    noteList = noteBox.values.toList();
    emit(NotesSuccessful());
  }
}
