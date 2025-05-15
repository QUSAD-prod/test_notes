part of 'note_bloc.dart';

abstract class NoteEvent {}

class NoteSaveEvent extends NoteEvent {
  NoteSaveEvent({required this.context});

  final BuildContext context;
}

class NoteTitleChangedEvent extends NoteEvent {}
