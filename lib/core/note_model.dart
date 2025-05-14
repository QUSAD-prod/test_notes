import 'package:hive_flutter/hive_flutter.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime dateTime;

  NoteModel copyWith({int? id, String? title, String? description, DateTime? dateTime}) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
