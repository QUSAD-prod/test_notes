import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_notes/core/models/note_model.dart';

class AppBox {
  static List<NoteModel> getNotes() {
    return GetIt.I<Box>().get('notes', defaultValue: <NoteModel>[]);
  }

  static Future<void> addNote(NoteModel note) async {
    List<NoteModel> list = getNotes();
    list.add(note);
    await GetIt.I<Box>().put('notes', list);
  }

  static Future<void> editNote(NoteModel note, {required int index}) async {
    List<NoteModel> list = getNotes();
    list[index].copyWith(title: note.title, description: note.description, dateTime: note.dateTime);
    await GetIt.I<Box>().put('notes', list);
  }
}
