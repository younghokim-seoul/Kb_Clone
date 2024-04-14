import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/app_list_item_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/feature/widget/season_list_item_body.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';

class SeasonEventView extends StatelessWidget {
  const SeasonEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DemoColors.primaryBoxColor,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "쇼핑&여행 300만 회원 달성 기념\n축하 댓글 달기",
              style: DemoTextStyles.bodyLarge.copyWith(
                  color: DemoColors.grey,
                  fontSize: 20,
                  height: 1.4,
                  fontWeight: FontWeight.w500),
            ).paddingSymmetric(horizontal: 20.w),
            Gap(8.h),
            Text(
              "#KBPay쇼핑구매",
              style: DemoTextStyles.bodyLarge.copyWith(
                  color: DemoColors.grey,
                  fontSize: 14,
                  height: 2,
                  fontWeight: FontWeight.w400),
            ).paddingSymmetric(horizontal: 20.w),
            Text(
              "#300명 추첨",
              style: DemoTextStyles.bodyLarge.copyWith(
                  color: DemoColors.grey,
                  fontSize: 14,
                  height: 2,
                  fontWeight: FontWeight.w400),
            ).paddingSymmetric(horizontal: 20.w),
            Gap(14.h),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox.square(
                dimension: 128,
                child: Assets.images.icCelebrateReward.image(),
              ),
            ).paddingSymmetric(horizontal: 16.w),
            Gap(14.h),
            SeasonListItemBody(
              icon: SizedBox.square(
                dimension: 60,
                child: Assets.images.icSeasonEvent.image(),
              ),
              title: '통신요금 더 아껴주는',
              subTitle: '통신요금 더 아껴주는',
            ),
            Gap(20.h),
            SeasonListItemBody(
              icon: SizedBox.square(
                dimension: 60,
                child: Assets.images.icSeasonEvent.image(),
              ),
              title: '최대 100만원을 받을 기회',
              subTitle: '설레는 새학기',
            ),
            Gap(20.h),
            SeasonListItemBody(
              icon: SizedBox.square(
                dimension: 60,
                child: Assets.images.icSeasonEvent.image(),
              ),
              title: '메가박스 추첨',
              subTitle: '이벤트',
            ),
          ],
        ),
      ),
    );
  }
}
