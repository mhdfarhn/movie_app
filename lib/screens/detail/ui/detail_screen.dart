import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/base_url.dart';
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
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(16.0),
                            ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${BaseUrl.tmdbImage}${_movie.backdropPath}',
                              fit: BoxFit.cover,
                              placeholder: (_, __) => const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.blue,
                                ),
                              ),
                              errorWidget: (_, __, ___) =>
                                  const Icon(Icons.error_outline_rounded),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12.0.w,
                          bottom: 8.0.h,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w,
                              vertical: 4.0.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColor.darkGray,
                            ),
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    double movieRate = double.tryParse(_movie
                                            .voteAverage
                                            .toStringAsFixed(1)) ??
                                        0;

                                    return SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 24.0.h),
                                          Text(
                                            'Rate this movie',
                                            style: AppTextStyle.body3.copyWith(
                                                color: AppColor.background),
                                          ),
                                          SizedBox(height: 20.0.h),
                                          Text(
                                            movieRate.toStringAsFixed(1),
                                            style: AppTextStyle.headline2
                                                .copyWith(
                                                    color: AppColor.background),
                                          ),
                                          SizedBox(height: 20.0.h),
                                          StatefulBuilder(
                                              builder: (context, setState) {
                                            return Slider(
                                              activeColor: AppColor.orange,
                                              thumbColor: AppColor.white,
                                              value: movieRate,
                                              min: 0.0,
                                              max: 10.0,
                                              onChanged: (value) {
                                                setState(() {
                                                  movieRate = value;
                                                });
                                              },
                                            );
                                          }),
                                          SizedBox(height: 20.0.h),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColor.blue,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 96.0.w,
                                                vertical: 20.0.h,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'OK',
                                              style: AppTextStyle.body2
                                                  .copyWith(
                                                      color: AppColor.white),
                                            ),
                                          ),
                                          SizedBox(height: 28.0.h),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    color: AppColor.orange,
                                    size: 16.0.sp,
                                  ),
                                  SizedBox(width: 4.0.w),
                                  Text(
                                    _movie.voteAverage.toStringAsFixed(1),
                                    style: AppTextStyle.caption1
                                        .copyWith(color: AppColor.orange),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0.h),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 120.0.w,
                        right: 28.0.w,
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
                        horizontal: 12.0.w,
                        vertical: 8.0.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<MovieDetailBloc, MovieDetailState>(
                            builder: (context, state) {
                              return MovieDescriptionItem(
                                icon: Icons.calendar_today_outlined,
                                info: state is MovieDetailLoaded
                                    ? state.movie.releaseDate!.substring(0, 4)
                                    : '',
                              );
                            },
                          ),
                          const MovieDescriptionDivider(),
                          BlocBuilder<MovieDetailBloc, MovieDetailState>(
                            builder: (context, state) {
                              return MovieDescriptionItem(
                                icon: Icons.watch_later_outlined,
                                info: state is MovieDetailLoaded
                                    ? '${state.movie.runtime} Minutes'
                                    : ' Minutes',
                              );
                            },
                          ),
                          const MovieDescriptionDivider(),
                          BlocBuilder<MovieDetailBloc, MovieDetailState>(
                            builder: (context, state) {
                              return MovieDescriptionItem(
                                icon: Icons.movie_outlined,
                                info: state is MovieDetailLoaded
                                    ? state.movie.genres![0]['name']
                                    : '',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 28.0.w,
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
              tabController: _tabController,
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
