import 'package:flutter_bloc/flutter_bloc.dart';

class MovieRatingCubit extends Cubit<double> {
  MovieRatingCubit() : super(0);

  void addRating(double rating) {
    emit(rating);
  }
}
