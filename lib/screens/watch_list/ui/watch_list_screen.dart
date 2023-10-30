import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/app_color.dart';
import 'package:movie_app/screens/watch_list/ui/widgets/empty_watch_list.dart';
import 'package:movie_app/screens/watch_list/ui/widgets/watch_list_app_bar.dart';
import 'package:movie_app/screens/watch_list/ui/widgets/watch_list_content.dart';

import '../../../core/data/models/movie_model.dart';
import '../../../core/widgets/error_text.dart';
import '../blocs/watch_list/watch_list_cubit.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  void initState() {
    context.read<WatchListCubit>().loadWatchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: watchListAppBar(),
      body: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          if (state is WatchListLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColor.blue),
            );
          } else if (state is WatchListError) {
            return ErrorText(text: state.error);
          } else if (state is WatchListLoaded) {
            List<MovieModel> movies = state.movies;

            return movies.isNotEmpty
                ? WatchListContent(movies: movies)
                : const EmptyWatchList();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
