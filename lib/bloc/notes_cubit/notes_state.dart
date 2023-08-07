part of 'notes_cubit.dart';

sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesSuccessfull extends NotesState {
  final List<NoteModel> notesList;

  NotesSuccessfull({required this.notesList});
}

final class NotesFailure extends NotesState {
  final String errMessage;

  NotesFailure({required this.errMessage});
}
