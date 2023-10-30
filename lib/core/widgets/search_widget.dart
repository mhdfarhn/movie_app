import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../screens/search/blocs/search_movie/search_movie_bloc.dart';
import '../app_color.dart';
import '../app_router.dart';
import '../app_text_style.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;

  const SearchWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.button.copyWith(color: AppColor.white),
      controller: controller,
      cursorColor: AppColor.blue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            style: BorderStyle.none,
            width: 0.0,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24.0.w,
          vertical: 12.0.h,
        ),
        filled: true,
        fillColor: AppColor.darkGray,
        labelText: 'Search',
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: AppTextStyle.button.copyWith(color: AppColor.gray),
        suffixIcon: GestureDetector(
          onTap: () {
            context
                .read<SearchMovieBloc>()
                .add(SearchMoviesByTitle(controller.text.trim()));
            goToSearchScreen(context);
          },
          child: Icon(
            Icons.search,
            color: AppColor.gray,
            size: 32.0.sp,
          ),
        ),
      ),
      onSubmitted: (value) {
        context.read<SearchMovieBloc>().add(SearchMoviesByTitle(value));
        goToSearchScreen(context);
      },
    );
  }

  void goToSearchScreen(BuildContext context) {
    if (GoRouter.of(context).routeInformationProvider.value.location == '/') {
      context.goNamed(
        AppRouter.search,
        extra: controller.text.trim(),
      );
    }
  }
}
