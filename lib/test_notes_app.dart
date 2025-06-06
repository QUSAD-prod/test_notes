import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_notes/core/repository/app_box.dart';
import 'package:test_notes/routing/app_router.dart';

class TestNotesApp extends StatefulWidget {
  const TestNotesApp({super.key});

  @override
  State<TestNotesApp> createState() => _TestNotesAppState();
}

class _TestNotesAppState extends State<TestNotesApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppBox.getListennableBox(),
      builder: (context, box, widget) {
        return MaterialApp.router(
          title: "Test Notes App",
          themeMode: AppBox.getThemeModeFromBox(box),
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          routerConfig: GetIt.I<AppRouter>().config(
            navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
          ),
        );
      },
    );
  }
}
