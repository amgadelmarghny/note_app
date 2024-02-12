import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/shared/app_constants/app_string.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/cash_helper/cash_helper.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? noteList;
  void fetchNote() {
    var noteBox = Hive.box<NoteModel>(AppString.kNotesBox);
    noteList = noteBox.values.toList();
    emit(NotesSuccessful());
  }

  bool isLight = true;
  void changeBritness({bool? fromCash}) {
    if (fromCash != null) {
      isLight = fromCash;
      emit(BritnessChangedState());
    } else {
      isLight = !isLight;
      CashHelper.setCash('isLight', isLight);
      emit(BritnessChangedState());
    }
  }
}
