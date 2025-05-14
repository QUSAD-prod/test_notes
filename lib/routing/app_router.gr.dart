// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [NoteScreen]
class NoteRoute extends PageRouteInfo<NoteRouteArgs> {
  NoteRoute({
    NoteScreenType type = NoteScreenType.newNote,
    NoteModel? note,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         NoteRoute.name,
         args: NoteRouteArgs(type: type, note: note, key: key),
         initialChildren: children,
       );

  static const String name = 'NoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteRouteArgs>(
        orElse: () => const NoteRouteArgs(),
      );
      return NoteScreen(type: args.type, note: args.note, key: args.key);
    },
  );
}

class NoteRouteArgs {
  const NoteRouteArgs({
    this.type = NoteScreenType.newNote,
    this.note,
    this.key,
  });

  final NoteScreenType type;

  final NoteModel? note;

  final Key? key;

  @override
  String toString() {
    return 'NoteRouteArgs{type: $type, note: $note, key: $key}';
  }
}
