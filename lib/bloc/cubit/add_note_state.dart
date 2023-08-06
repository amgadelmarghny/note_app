part of 'add_note_cubit.dart';


sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccessfull extends AddNoteState {}

final class AddNotefailure extends AddNoteState {
  final String errMessage;

  AddNotefailure({required this.errMessage});
}
