import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_notes/core/note_model.dart';
import 'package:test_notes/features/note/bloc/note_bloc.dart';

enum NoteScreenType { newNote, editNote }

@RoutePage()
class NoteScreen extends StatefulWidget {
  const NoteScreen({this.type = NoteScreenType.newNote, this.note, super.key});

  final NoteScreenType type;
  final NoteModel? note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _noteBloc = NoteBloc();

  late final TextEditingController _titleController, _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteBloc, NoteState>(
      bloc: _noteBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.type == NoteScreenType.newNote ? "Новая заметка" : widget.note!.title,
            ),
            actions: [
              IconButton(onPressed: () => _noteBloc.add(NoteSaveEvent()), icon: Icon(Icons.save)),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _titleController,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _descriptionController,
                      minLines: 20,
                      maxLines: 100,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
