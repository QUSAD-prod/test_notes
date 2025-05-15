import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  NoteModel({required this.title, required this.description, required this.dateTime});

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime dateTime;

  NoteModel copyWith({String? title, String? description, required DateTime dateTime}) {
    return NoteModel(
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime,
    );
  }
}
