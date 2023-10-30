import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/screens/home/blocs/now_playing_movie/now_playing_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/popular_movie/popular_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/top_rated_movie/top_rated_movie_cubit.dart';
import 'package:movie_app/screens/home/blocs/upcoming_movie/upcoming_movie_cubit.dart';

import '../../../core/widgets/app_widgets.dart';
import '../blocs/top_five_movie/top_five_movie_cubit.dart';
import 'widgets/home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Now Playing'),
    Tab(text: 'Upcoming'),
    Tab(text: 'Top Rated'),
    Tab(text: 'Popular'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);

    context.read<TopFiveMovieCubit>().loadTopFiveMovies();
    context.read<NowPlayingMovieCubit>().loadNowPlayingMovies();
    context.read<UpcomingMovieCubit>().loadUpcomingMovies();
    context.read<TopRatedMovieCubit>().loadTopRatedMovies();
    context.read<PopularMovieCubit>().loadPopularMovies();

    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: homeAppBar(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: SearchWidget(controller: _searchController),
            ),
            SizedBox(height: 24.0.h),
            const TopFiveMovieContent(),
            SizedBox(height: 44.0.h),
            TabBarWidget(
              tabs: _tabs,
              controller: _tabController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0.w,
                vertical: 20.0.h,
              ),
              child: [
                const NowPlayingMovieContent(),
                const UpcomingMovieContent(),
                const TopRatedMovieContent(),
                const PopularMovieContent(),
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }
}
