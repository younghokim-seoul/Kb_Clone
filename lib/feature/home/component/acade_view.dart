import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/app_list_item_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class AcadeView extends StatelessWidget {
  const AcadeView({super.key});

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
                child: Assets.images.icGetPointTriple.image(),
              ),
              title: '쓱쌓',
              subTitle: '포인트라 3번더 받기',
            ),
            AppListItemBody(
              icon: SizedBox.square(
                dimension: 43,
                child: Assets.images.icRewardNews.image(),
              ),
              title: '혜택뉴스',
              subTitle: '놓치면 아까운 소식',
            ),
            AppListItemBody(
              icon: SizedBox.square(
                dimension: 43,
                child: Assets.images.icTodayHoroscope.image(),
              ),
              title: '오늘의 운세',
              subTitle: '행운을 찾아줘',
            ),
          ],
        ),
      ),
    );
  }
}
