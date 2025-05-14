import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_notes/features/home/bloc/home_bloc.dart';
import 'package:test_notes/routing/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: _homeBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Test Notes App")),
          body: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.min, children: [])),
          floatingActionButton: FloatingActionButton(
            onPressed: () => GetIt.I<AppRouter>().push(NoteRoute()),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
