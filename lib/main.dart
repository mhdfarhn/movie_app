import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/app_bloc_observer.dart';
import 'package:movie_app/core/data/services/databases/watch_list_box.dart';
import 'package:movie_app/screens/detail/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movie_app/screens/detail/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app/screens/detail/blocs/movie_review/movie_review_bloc.dart';
import 'package:movie_app/screens/home/blocs/now_playing_movie/now_playing_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/top_five_movie/top_five_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/top_rated_movie/top_rated_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/upcoming_movie/upcoming_movie_cubit.dart';
import 'package:movie_app/screens/search/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app/screens/watch_list/blocs/watch_list/watch_list_cubit.dart';

import 'core/app_color.dart';
import 'core/app_router.dart';
import 'core/data/models/movie_model.dart';
import 'core/data/services/apis/tmdb_api_service.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  watchListBox = await Hive.openBox<MovieModel>('watchListBox');
  Bloc.observer = const AppBlocObserver();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      builder: (_, __) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => TMDBApiService(),
            ),
            RepositoryProvider(
              create: (context) => WatchListBox(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      MovieCastBloc(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      MovieDetailBloc(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      MovieReviewBloc(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      NowPlayingMovieCubit(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      PopularMovieCubit(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      SearchMovieBloc(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      TopFiveMovieCubit(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      TopRatedMovieCubit(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      UpcomingMovieCubit(context.read<TMDBApiService>())),
              BlocProvider(
                  create: (context) =>
                      WatchListCubit(context.read<WatchListBox>())),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              title: 'Movie App',
              theme: ThemeData(
                scaffoldBackgroundColor: AppColor.background,
                splashFactory: NoSplash.splashFactory,
                useMaterial3: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
