import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/home/component/acade_view.dart';
import 'package:kb_bank_clone/feature/home/component/event_view.dart';
import 'package:kb_bank_clone/feature/home/component/feed_view.dart';
import 'package:kb_bank_clone/feature/home/component/menu_view.dart';
import 'package:kb_bank_clone/feature/home/component/point_reward_view.dart';
import 'package:kb_bank_clone/feature/home/component/season_event_view.dart';
import 'package:kb_bank_clone/feature/home/component/special_price_view.dart';
import 'package:kb_bank_clone/feature/home/component/watch_reward_view.dart';
import 'package:kb_bank_clone/feature/widget/app_list_item_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/feature/widget/usage_item_body.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

@RoutePage()
class CardUsageDetailsPage extends ConsumerWidget {
  const CardUsageDetailsPage({super.key});

  static const routeName = '/card_usage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
        title: "카드이용내역 조회",
        actions: [
          InkWell(
            onTap: () => context.router.push(const SettingRoute()),
            child: Assets.images.icMenu.image(fit: BoxFit.contain),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _buildHeader(),
              Gap(48.h),
              UsageItemBody(
                icon: Assets.images.icExpectedPaymentAmount
                    .image(fit: BoxFit.contain),
                title: "결제예정금액",
                subTitle: "이번달/다음달 결제금액 확인",
              ),
              Gap(16.h),
              InkWell(
                onTap: () =>
                    context.router.push(const UsageFeeStatementRoute()),
                child: UsageItemBody(
                  icon: Assets.images.icStatementOfUsageFee
                      .image(fit: BoxFit.contain),
                  title: "이용대금명세서",
                  subTitle: "월별 이용내역과 소비리포트를\n한번에 확인",
                ),
              ),
              Gap(16.h),
              UsageItemBody(
                icon: Assets.images.icSalesSlip.image(fit: BoxFit.contain),
                title: "이용내역(매출전표)",
                subTitle: "원하는 조회조건으로\n이용내역 확인",
              ),
              Gap(16.h),
              UsageItemBody(
                icon:
                    Assets.images.icIncomeDeduction.image(fit: BoxFit.contain),
                title: "신용카드소득공제",
                subTitle: "연말정산을 위한\n신용카드 등 사용금액확인서 확인",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: DemoColors.primaryBoxColor,
          borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        width: 1.sw,
        child: Text(
          "간편하게 카드이용내역을 확인해 보세요!",
          style: DemoTextStyles.bodyLarge.copyWith(
              color: DemoColors.primaryDivideColor,
              fontSize: 17,
              fontWeight: FontWeight.w300),
        ).paddingSymmetric(vertical: 20.h, horizontal: 16.w),
      ),
    );
  }
}
