import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_color.dart';
import '../../../../../core/app_text_style.dart';
import '../../../blocs/movie_detail/movie_detail_bloc.dart';

class AboutMovieSection extends StatelessWidget {
  const AboutMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 28.0.w,
              vertical: 24.0.h,
            ),
            child: Text(
              state.movie.overview!,
              textAlign: TextAlign.start,
              style: AppTextStyle.caption2.copyWith(color: AppColor.white),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
