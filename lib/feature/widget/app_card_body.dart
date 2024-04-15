import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

enum AppCardSize {
  medium,
  large,
}

class AppCardBody extends StatelessWidget {
  const AppCardBody({
    required this.title,
    required this.icon,
    required this.size,
    super.key,
  });

  const AppCardBody.medium({
    required this.title,
    required this.icon,
    super.key,
  }) : size = AppCardSize.medium;

  const AppCardBody.large({
    required this.title,
    required this.icon,
    super.key,
  }) : size = AppCardSize.large;

  final String title;
  final Widget icon;

  final AppCardSize size;

  double get dimension => switch (size) {
        AppCardSize.medium => 32,
        AppCardSize.large => 38,
      };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(dimension: dimension, child: icon),
          Gap(8.h),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: DemoTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w400,
                color: DemoColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
