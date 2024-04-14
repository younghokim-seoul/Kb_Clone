import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class AppCardBody extends StatelessWidget {
  const AppCardBody({super.key, required this.title, required this.icon});

  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(dimension: 38, child: icon),
          Gap(8.h),
          Flexible(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: DemoTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w400,
                color: DemoColors.grey
              ),
            ),
          ),
        ],
      ),
    );
  }
}
