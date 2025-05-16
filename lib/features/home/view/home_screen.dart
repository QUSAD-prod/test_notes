import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_notes/core/models/note_model.dart';
import 'package:test_notes/core/repository/app_box.dart';
import 'package:test_notes/features/home/bloc/home_bloc.dart';
import 'package:test_notes/features/home/view/note_card.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  @override
  void initState() {
    _homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Заметки"),
            leading: IconButton(
              onPressed: () => _homeBloc.add(HomeChangeThemeEvent()),
              icon: Icon(
                Theme.of(context).brightness == Brightness.light ? Icons.sunny : Icons.nightlight,
              ),
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: Opacity(
                  opacity: 0.25,
                  child: Text(
                    "by QUSAD.prod",
                    style: TextTheme.of(
                      context,
                    ).displaySmall?.copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: AppBox.getListennableBox(),
                builder: (context, box, widget) {
                  List<NoteModel> list = AppBox.getNotesWithBox(box);
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          _homeBloc.add(HomeDeleteNoteEvent(index: index));
                        },
                        child: GestureDetector(
                          child: NoteCard(note: list[index]),
                          onTap:
                              () => _homeBloc.add(
                                HomeUpdateNoteTapEvent(
                                  context: context,
                                  index: index,
                                  note: list[index],
                                ),
                              ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _homeBloc.add(HomeAddNoteTapEvent(context: context)),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
