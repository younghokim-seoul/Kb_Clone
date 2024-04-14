import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class SeasonListItemBody extends StatelessWidget {
  const SeasonListItemBody({
    required this.icon,
    required this.title,
    required this.subTitle,
    this.color,
    super.key,
  });

  final Widget icon;
  final String title;
  final String subTitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: icon,
            ),
            Gap(20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: DemoTextStyles.titleLarge.copyWith(
                      color: DemoColors.grey,
                      fontSize: 16,
                      height: 1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    subTitle,
                    style: DemoTextStyles.bodyLarge.copyWith(
                      color: DemoColors.grey,
                      fontSize: 14,
                      height: 1,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.w),
            FlexIconButton.medium(
              icon: CupertinoIcons.right_chevron,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
