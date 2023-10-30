import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/movie_review/movie_review_bloc.dart';
import '../review_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieReviewBloc, MovieReviewState>(
      builder: (context, state) {
        if (state is MovieReviewLoaded) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0.w,
              vertical: 24.0.h,
            ),
            child: Column(
              children: List.generate(
                state.reviews.length,
                (index) => ReviewCard(review: state.reviews[index]),
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
