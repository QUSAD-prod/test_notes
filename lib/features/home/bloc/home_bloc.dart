import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_notes/core/models/note_model.dart';
import 'package:test_notes/core/repository/app_box.dart';
import 'package:test_notes/features/note/view/view.dart';
import 'package:test_notes/routing/app_router.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) {});
    on<HomeAddNoteTapEvent>((event, emit) {
      GetIt.I<AppRouter>().push(NoteRoute());
    });
    on<HomeUpdateNoteTapEvent>((event, emit) {
      GetIt.I<AppRouter>().push(
        NoteRoute(type: NoteScreenType.editNote, editIndex: event.index, note: event.note),
      );
    });
    on<HomeDeleteNoteEvent>((event, emit) async {
      await AppBox.deleteNote(event.index);
    });

    on<HomeChangeThemeEvent>((event, emit) async {
      await AppBox.changeThemeMode();
    });
  }
}
