import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_color.dart';
import '../data/models/movie_model.dart';

class CoverArtCard extends StatelessWidget {
  final MovieModel movie;

  const CoverArtCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0.dm),
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original${movie.posterPath}',
          fit: BoxFit.cover,
          placeholder: (_, __) => const Center(
            child: CircularProgressIndicator(color: AppColor.blue),
          ),
          errorWidget: (_, __, ___) => const Icon(Icons.error_outline_rounded),
        ),
      ),
    );
  }
}
