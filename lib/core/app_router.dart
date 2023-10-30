import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/widgets/scaffold_with_nested_navigation.dart';
import 'package:movie_app/screens/detail/ui/detail_screen.dart';
import 'package:movie_app/screens/search/ui/search_screen.dart';
import 'package:movie_app/screens/watch_list/ui/watch_list_screen.dart';

import '../screens/home/ui/home_screen.dart';
import 'data/models/movie_model.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final GlobalKey<NavigatorState> _searchNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
  static final GlobalKey<NavigatorState> _watchListNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellWatchList');

  static const String home = 'home';
  static const String search = 'search';
  static const String watchList = 'watch-list';
  static const String detail = 'detail';

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                name: home,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _searchNavigatorKey,
            routes: [
              GoRoute(
                path: '/search',
                name: search,
                pageBuilder: (context, state) {
                  final String? searchText = state.extra as String?;
                  return NoTransitionPage(
                    child: SearchScreen(searchText: searchText),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _watchListNavigatorKey,
            routes: [
              GoRoute(
                path: '/watch-list',
                name: watchList,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: WatchListScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/detail/:id',
        name: detail,
        builder: (context, state) {
          final String id = state.pathParameters['id'] as String;
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          final MovieModel movie = extra['movie'] as MovieModel;
          final String path = extra['path'] as String;
          return DetailScreen(
            id: id,
            movie: movie,
            path: path,
          );
        },
      ),
    ],
  );
}
