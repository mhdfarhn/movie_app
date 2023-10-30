import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/base_url.dart';
import '../../../blocs/movie_cast/movie_cast_bloc.dart';
import '../cast_item.dart';

class CastSection extends StatelessWidget {
  const CastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
      builder: (context, state) {
        if (state is MovieCastLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.h,
              vertical: 24.0.w,
            ),
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 24.0.h,
              children: List.generate(
                state.casts.length,
                (index) => CastItem(
                  imageUrl:
                      '${BaseUrl.tmdbImage}${state.casts[index].profilePath}',
                  name: state.casts[index].name!,
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
