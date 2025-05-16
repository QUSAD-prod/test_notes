part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeUpdateNoteTapEvent extends HomeEvent {
  HomeUpdateNoteTapEvent({required this.context, required this.index, required this.note});

  final BuildContext context;
  final int index;
  final NoteModel note;
}

class HomeAddNoteTapEvent extends HomeEvent {
  HomeAddNoteTapEvent({required this.context});

  final BuildContext context;
}

class HomeDeleteNoteEvent extends HomeEvent {
  HomeDeleteNoteEvent({required this.index});

  final int index;
}

class HomeChangeThemeEvent extends HomeEvent {}
