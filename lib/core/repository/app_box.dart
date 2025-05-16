import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_notes/core/models/note_model.dart';

class AppBox {
  static List<NoteModel> getNotes() {
    final List<dynamic> dynamicList = GetIt.I<Box>().get('notes', defaultValue: <NoteModel>[]);
    return dynamicList.cast<NoteModel>();
  }

  static ThemeMode getThemeMode() {
    return GetIt.I<Box>().get('themeMode', defaultValue: ThemeMode.light);
  }

  static Future<void> changeThemeMode() async {
    ThemeMode mode = GetIt.I<Box>().get('themeMode', defaultValue: ThemeMode.light);
    if (mode == ThemeMode.light) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.light;
    }
    await GetIt.I<Box>().put('themeMode', mode);
  }

  static List<NoteModel> getNotesWithBox(Box box) {
    final List<dynamic> dynamicList = box.get('notes', defaultValue: <NoteModel>[]);
    return dynamicList.cast<NoteModel>();
  }

  static Future<void> addNote(NoteModel note) async {
    List<NoteModel> list = getNotes();
    list.add(note);
    await GetIt.I<Box>().put('notes', list);
  }

  static Future<void> editNote(NoteModel note, {required int index}) async {
    List<NoteModel> list = getNotes();
    list[index] = list[index].copyWith(
      title: note.title,
      description: note.description,
      dateTime: note.dateTime,
    );
    await GetIt.I<Box>().put('notes', list);
  }

  static Future<void> deleteNote(int index) async {
    List<NoteModel> list = getNotes();
    list.removeAt(index);
    await GetIt.I<Box>().put('notes', list);
  }

  static ValueListenable<Box<dynamic>> getListennableBox({List<dynamic>? keys}) {
    return GetIt.I<Box>().listenable(keys: keys);
  }
}
