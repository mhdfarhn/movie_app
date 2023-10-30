import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_text_style.dart';
import '../../../../core/data/models/movie_model.dart';
import '../../../watch_list/blocs/watch_list/watch_list_cubit.dart';

AppBar detailAppBar({
  required BuildContext context,
  required MovieModel movie,
  required String path,
}) {
  return AppBar(
    backgroundColor: AppColor.background,
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.only(left: 24.0.w),
      child: GestureDetector(
        onTap: () {
          context.goNamed(path);
        },
        child: Icon(
          Icons.keyboard_arrow_left_rounded,
          color: AppColor.white,
          size: 24.0.sp,
        ),
      ),
    ),
    title: Text(
      'Detail',
      style: AppTextStyle.body2.copyWith(color: AppColor.brokenWhite),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 24.0.w),
        child: BlocBuilder<WatchListCubit, WatchListState>(
          builder: (context, state) {
            if (state is WatchListLoading) {
              return const CircularProgressIndicator(color: AppColor.blue);
            } else if (state is WatchListNotAdded) {
              return GestureDetector(
                onTap: () =>
                    context.read<WatchListCubit>().addToWatchList(movie),
                child: Icon(
                  Icons.bookmark_outline_rounded,
                  color: AppColor.white,
                  size: 24.0.sp,
                ),
              );
            } else if (state is WatchListAdded) {
              return GestureDetector(
                onTap: () => context
                    .read<WatchListCubit>()
                    .deleteFromWatchList(movie.id),
                child: Icon(
                  Icons.bookmark,
                  color: AppColor.white,
                  size: 24.0.sp,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      )
    ],
  );
}
