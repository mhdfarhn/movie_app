import 'package:flutter/material.dart';

import '../app_color.dart';
import '../app_text_style.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyle.body3.copyWith(color: AppColor.white),
    );
  }
}
