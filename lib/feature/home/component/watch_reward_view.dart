import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/app_list_item_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class WatchRewardView extends StatelessWidget {
  const WatchRewardView({super.key});

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
          children: [
            AppListItemBody(
              icon: SizedBox.square(
                dimension: 43,
                child: Assets.images.icCheckPlus.image(),
              ),
              title: '출첵 플러스',
              subTitle: '포인트라 3번더 받기',
            ),
            AppListItemBody(
              icon: SizedBox.square(
                dimension: 43,
                child: Assets.images.icAdReword.image(),
              ),
              title: '바로적립',
              subTitle: '광고보면 포인트리',
            ),
            AppListItemBody(
              icon: SizedBox.square(
                dimension: 43,
                child: Assets.images.icLiveReword.image(),
              ),
              title: '라방 보고 적립',
              subTitle: '라방 매일 보고 매일 최대 40P 적립',
            ),
          ],
        ),
      ),
    );
  }
}
