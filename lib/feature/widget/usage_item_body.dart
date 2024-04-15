import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class UsageItemBody extends StatelessWidget {
  const UsageItemBody({
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
          8,
        ),
        border: Border.all(
          color: DemoColors.primaryBoxColorLight,
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 21.w),
        child: Row(
          children: [
            icon,
            Gap(16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: DemoTextStyles.titleLarge
                        .copyWith(color: DemoColors.grey, fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Gap(10.h),
                  Text(
                    subTitle,
                    style: DemoTextStyles.bodyLarge
                        .copyWith(color: DemoColors.primaryDivideColor, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Gap(20.w),
            const SizedBox.square(
              dimension: 24,
              child: Icon(
                CupertinoIcons.right_chevron,
                color: DemoColors.grey,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
