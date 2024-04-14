import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DemoColors.primaryBoxColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Assets.images.icFeedSample
                    .image(width: 1.sw, height: 132.h, fit: BoxFit.fill),
              ),
              Positioned(
                left: 20.h,
                top: 20.w,
                child: Text(
                  '별 보러 가는길',
                  style: DemoTextStyles.bodyLarge
                      .copyWith(color: DemoColors.grey, fontSize: 20),
                ),
              ),
            ],
          ),
          Gap(16.h),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Gap(16.w),
                    SizedBox.square(
                      dimension: 34,
                      child:
                          Assets.images.icShortClip.image(fit: BoxFit.fitWidth),
                    ),
                    Gap(8.w),
                    Flexible(
                      child: Text(
                        'KB 숏클립',
                        style: DemoTextStyles.bodyLarge
                            .copyWith(color: DemoColors.grey, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Gap(16.w),
                    SizedBox.square(
                      dimension: 34,
                      child: Assets.images.ic1MinuteNews
                          .image(fit: BoxFit.fitWidth),
                    ),
                    Gap(8.w),
                    Flexible(
                      child: Text(
                        '1분 뉴스',
                        style: DemoTextStyles.bodyLarge
                            .copyWith(color: DemoColors.grey, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Gap(16.h),
          Container(
            width: 1.sw,
            height: 1,
            color: DemoColors.primaryDivideColor,
          ),
          Gap(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(8.w),
              Flexible(
                child: Text(
                  '피드 더보기',
                  style: DemoTextStyles.bodyLarge.copyWith(
                      color: DemoColors.grey, fontSize: 16, height: 1),
                ),
              ),
              Gap(8.w),
              const Center(
                child: Icon(
                  CupertinoIcons.right_chevron,
                  size: 12,
                  color: DemoColors.grey,
                ),
              )
            ],
          ),
          Gap(16.h),
        ],
      ),
    );
  }
}
