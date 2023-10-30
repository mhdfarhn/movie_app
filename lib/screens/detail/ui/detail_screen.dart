import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/cover_art_card.dart';
import 'package:movie_app/screens/watch_list/blocs/watch_list/watch_list_cubit.dart';

import '../../../core/app_color.dart';
import '../../../core/app_text_style.dart';
import '../../../core/data/models/movie_model.dart';
import '../../../core/widgets/tab_bar_widget.dart';
import '../blocs/movie_cast/movie_cast_bloc.dart';
import '../blocs/movie_detail/movie_detail_bloc.dart';
import '../blocs/movie_review/movie_review_bloc.dart';
import 'widgets/detail_widgets.dart';
import 'widgets/sections/detail_sections.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final MovieModel movie;
  final String path;

  const DetailScreen({
    super.key,
    required this.id,
    required this.movie,
    required this.path,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    const Tab(text: 'About Movie'),
    const Tab(text: 'Reviews'),
    const Tab(text: 'Cast'),
  ];

  late MovieModel _movie;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _movie = widget.movie;

    context.read<MovieDetailBloc>().add(LoadMovieDetail(widget.id));
    context.read<MovieReviewBloc>().add(LoadMovieReviews(widget.id));
    context.read<MovieCastBloc>().add(LoadMovieCasts(widget.id));
    context.read<WatchListCubit>().isMovieWatchListed(widget.movie.id);

    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bannerImageHeight = MediaQuery.of(context).size.width / 16 * 9;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: detailAppBar(
          context: context,
          movie: _movie,
          path: widget.path,
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BannerImageWidget(movie: _movie),
                    SizedBox(height: 12.0.h),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 120.0.w,
                        right: 24.0.w,
                      ),
                      child: Text(
                        _movie.title,
                        style:
                            AppTextStyle.body2.copyWith(color: AppColor.white),
                      ),
                    ),
                    SizedBox(height: 40.0.h),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0.w,
                        vertical: 8.0.h,
                      ),
                      child: const MovieDescriptionWidget(),
                    ),
                  ],
                ),
                Positioned(
                  left: 24.0.w,
                  top: bannerImageHeight - 60.0.h,
                  child: SizedBox(
                    height: 120.0.h,
                    width: 80.0.w,
                    child: CoverArtCard(movie: _movie),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0.h),
            TabBarWidget(
              tabs: _tabs,
              controller: _tabController,
            ),
            [
              const AboutMovieSection(),
              const ReviewsSection(),
              const CastSection(),
            ][_tabController.index],
          ],
        ),
      ),
    );
  }
}
