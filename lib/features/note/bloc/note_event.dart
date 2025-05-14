part of 'note_bloc.dart';

abstract class NoteEvent {}

class NoteSaveEvent extends NoteEvent {}

class NoteAddImageEvent extends NoteEvent {}

class NoteChangeImageEvent extends NoteEvent {}
