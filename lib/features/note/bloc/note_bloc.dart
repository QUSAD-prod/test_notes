import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_notes/core/models/note_model.dart';
import 'package:test_notes/core/repository/app_box.dart';
import 'package:test_notes/features/note/view/note_screen.dart';
import 'package:test_notes/routing/app_router.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final TextEditingController titleController, descriptionController;
  final NoteScreenType type;
  final int? editIndex;

  NoteBloc(
    this.type, {
    this.editIndex,
    required this.titleController,
    required this.descriptionController,
  }) : super(NoteInitialState()) {
    on<NoteTitleChangedEvent>((event, emit) {
      emit(NoteNormalState());
    });
    on<NoteSaveEvent>((event, emit) async {
      if (titleController.text != "") {
        NoteModel note = NoteModel(
          title: titleController.text,
          description: descriptionController.text,
          dateTime: DateTime.now(),
        );
        if (type == NoteScreenType.newNote) {
          await AppBox.addNote(note);
        } else {
          await AppBox.editNote(note, index: editIndex!);
        }
        GetIt.I<AppRouter>().pop();
      } else {
        emit(NoteErrorState());
        ScaffoldMessenger.of(
          event.context,
        ).showSnackBar(SnackBar(content: const Text('Заголовок не может быть пустым!')));
      }
    });
  }
}
