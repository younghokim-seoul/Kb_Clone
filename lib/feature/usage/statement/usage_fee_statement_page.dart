import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
import 'package:kb_bank_clone/utils/extension/value_extension.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

@RoutePage()
class UsageFeeStatementPage extends ConsumerStatefulWidget {
  const UsageFeeStatementPage({super.key});

  static const routeName = '/usage_fee_statement';

  @override
  ConsumerState createState() => _UsageFeeStatementPageState();
}

class _UsageFeeStatementPageState extends ConsumerState<UsageFeeStatementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
        title: "이용대금명세서",
        actions: [
          InkWell(
            onTap: () => context.router.push(const SettingRoute()),
            child: Assets.images.icMenu.image(fit: BoxFit.cover),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _buildHeader(),
              Gap(43.h),
              _buildTotalUsageFee(),
              Gap(65.h),
              _buildCardUsageFee(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return DecoratedBox(
      decoration: BoxDecoration(color: DemoColors.primaryBoxColorLight),
      child: Row(
        children: [
          Gap(20.w),
          FlexIconButton.medium(
            icon: CupertinoIcons.left_chevron,
            onPressed: () => context.router.popForced(),
          ),
          Expanded(
            child: Text(
              '24년 1월 명세서',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ).paddingSymmetric(vertical: 22.h),
          ),
          FlexIconButton.medium(
            icon: CupertinoIcons.right_chevron,
            onPressed: () => context.router.pop(),
          ),
          Gap(20.w),
        ],
      ),
    );
  }

  Widget _buildTotalUsageFee() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '작성기준일 24. 01. 03',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(20.w),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                border: Border.all(color: DemoColors.grey, width: 1.w),
              ),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 16.w,
                    child: Assets.images.icChart.image(fit: BoxFit.cover),
                  ),
                  Gap(12.w),
                  Text(
                    '소비 리포트',
                    style: DemoTextStyles.labelSmall.copyWith(
                      color: DemoColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
            )
          ],
        ),
        Gap(14.h),
        Row(
          children: [
            Text(
              '가가가',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '의 총 이용대금',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Gap(12.h),
        Text(
          '${2000000.toCurrency()}원',
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.lightMoneyColor,
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 24.w);
  }

  Widget _buildCardUsageFee() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DemoColors.primaryDivideColor, width: 1.w),
      ),
      child: SizedBox(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(32.h),
            Text(
              '신용카드',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(12.h),
            Text(
              '${45921.toCurrency()}원',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            Gap(24.h),
            Row(
              children: [
                InkWell(
                  onTap: () => context.router.push(const UsageFeeDetailsRoute()),
                  child: _buildButton(title: '이용내역'),
                ),
                Gap(12.w),
                _buildButton(title: '카드별 이용금액'),
              ],
            ),
            Gap(20.h),
            Container(color: DemoColors.primaryDivideColor, height: 1.h),
            Gap(20.h),
            _buildSummary(),
            Gap(24.h),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    ).paddingSymmetric(horizontal: 16.w, vertical: 8.h);
  }

  Widget _buildSummary(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "결제일 : 24.09.09",
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(12.h),
        Text(
          "실제출금일 : 24. 09.09",
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(12.h),
        Text(
          "결제계좌 : 국민은행 000000-**-***000",
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildButton({required String title}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: DemoColors.lightButtonLabelText,
      ),
      child: Center(
        child: Text(
          title,
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ).paddingSymmetric(horizontal: 32.w, vertical: 10.h),
    );
  }
}
