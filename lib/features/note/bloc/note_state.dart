part of 'note_bloc.dart';

abstract class NoteState {
  bool errorEnabled = false;
}

class NoteInitialState extends NoteState {}

class NoteNormalState extends NoteState {}

class NoteErrorState extends NoteState {
  @override
  final bool errorEnabled = true;
}
