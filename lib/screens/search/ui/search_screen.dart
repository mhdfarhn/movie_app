import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/error_text.dart';
import 'package:movie_app/screens/search/ui/widgets/movies_found_widget.dart';
import 'package:movie_app/screens/search/ui/widgets/movies_not_found_widget.dart';
import 'package:movie_app/screens/search/ui/widgets/search_app_bar.dart';

import '../../../core/app_color.dart';
import '../../../core/data/models/movie_model.dart';
import '../../../core/widgets/search_widget.dart';
import '../blocs/search_movie/search_movie_bloc.dart';

class SearchScreen extends StatefulWidget {
  final String? searchText;

  const SearchScreen({super.key, this.searchText});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.text = widget.searchText ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(context),
      body: Column(
        children: [
          SizedBox(height: 16.0.h),
          Padding(
            padding: EdgeInsets.only(
              left: 28.0.w,
              top: 16.0.h,
              right: 28.0.w,
              bottom: 24.0.h,
            ),
            child: SearchWidget(
              controller: _searchController,
              onTap: () {
                context
                    .read<SearchMovieBloc>()
                    .add(SearchMoviesByTitle(_searchController.text.trim()));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
              builder: (context, state) {
                if (state is SearchMovieInitial) {
                  return Container();
                } else if (state is SearchMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColor.blue),
                  );
                } else if (state is SearchMovieLoaded) {
                  final List<MovieModel> movies = state.movies;

                  return movies.isNotEmpty
                      ? MoviesFoundWidget(movies: movies)
                      : const MoviesNotFoundWidget();
                } else if (state is SearchMovieError) {
                  return ErrorText(text: state.error);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
