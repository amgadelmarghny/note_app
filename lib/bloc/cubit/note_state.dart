part of 'note_cubit.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteSuccess extends NoteState {}

final class Notefailure extends NoteState {
  final String errMessage;

  Notefailure({required this.errMessage});
}