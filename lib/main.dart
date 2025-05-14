import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:test_notes/core/note_model.dart';
import 'package:test_notes/routing/app_router.dart';
import 'package:test_notes/test_notes_app.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final talker = TalkerFlutter.init();
      talker.debug('Talker started...');

      await Hive.initFlutter();
      Hive.registerAdapter(NoteModelAdapter());

      final appRouter = AppRouter();
      GetIt.I.registerSingleton(appRouter);

      Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(),
      );

      FlutterError.onError = (details) {
        talker.handle(details.exception, details.stack);
      };

      GetIt.I.registerSingleton(talker);

      runApp(const TestNotesApp());
    },
    (error, stackTrace) {
      GetIt.I<Talker>().handle(error, stackTrace);
    },
  );
}
