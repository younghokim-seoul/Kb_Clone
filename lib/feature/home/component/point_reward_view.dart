import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class PointRewardView extends StatelessWidget {
  const PointRewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DemoColors.yellow,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          top: 11.h,
          bottom: 11.h,
          right: 12,
        ),
        child: Row(
          children: [
            Assets.images.icBear
                .image(width: 64, height: 70, fit: BoxFit.contain),
            Gap(20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'KB Pay 결제하고 포인트리 받기',
                    style: DemoTextStyles.titleLarge.copyWith(
                        color: DemoColors.primaryTextColor,
                        fontWeight: FontWeight.w300),
                  ),
                  Gap(3.h),
                  Text(
                    '큽(KB)니버스',
                    style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.primaryTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
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
