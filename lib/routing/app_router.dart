import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:test_notes/core/note_model.dart';
import 'package:test_notes/features/home/view/home_screen.dart';
import 'package:test_notes/features/note/view/note_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: NoteRoute.page),
  ];
}
