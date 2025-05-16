import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_notes/core/models/note_model.dart';
import 'package:test_notes/features/note/bloc/note_bloc.dart';

enum NoteScreenType { newNote, editNote }

@RoutePage()
class NoteScreen extends StatefulWidget {
  const NoteScreen({this.type = NoteScreenType.newNote, this.note, this.editIndex, super.key});

  final NoteScreenType type;
  final NoteModel? note;
  final int? editIndex;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late final NoteBloc _noteBloc;

  late final TextEditingController _titleController, _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    if (widget.type == NoteScreenType.editNote) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
    }
    _noteBloc = NoteBloc(
      widget.type,
      titleController: _titleController,
      descriptionController: _descriptionController,
      editIndex: widget.editIndex,
    );
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
              widget.type == NoteScreenType.newNote ? "Новая заметка" : "Редактировать заметку",
            ),
            actions: [
              IconButton(
                onPressed: () => _noteBloc.add(NoteSaveEvent(context: context)),
                icon: Icon(Icons.save),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextFormField(
                      controller: _titleController,
                      onChanged: (string) => _noteBloc.add(NoteTitleChangedEvent()),
                      minLines: 1,
                      maxLines: 4,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        hintText: "Название заметки...",
                        hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.5),
                        ),
                        errorText: state.errorEnabled ? "" : null,
                        errorStyle: TextStyle(fontSize: 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: TextField(
                      controller: _descriptionController,
                      minLines: 20,
                      maxLines: 100,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration.collapsed(hintText: "Текст заметки..."),
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
