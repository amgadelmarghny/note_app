part of 'notes_cubit.dart';

sealed class NotesStates {}

final class NotesInitial extends NotesStates {}

final class NotesSuccessful extends NotesStates {}

final class BritnessChangedState extends NotesStates {}
