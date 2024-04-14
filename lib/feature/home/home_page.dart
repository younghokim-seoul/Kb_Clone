import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
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
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        leading: SizedBox.square(
          dimension: 72,
          child: Material(
            type: MaterialType.transparency,
            child: Center(
                child: Assets.images.titleLogo.image(fit: BoxFit.contain)),
          ),
        ),
        actions: [
          Assets.images.icMyPage.image(fit: BoxFit.contain),
          Gap(16.w),
          Assets.images.icSearch.image(fit: BoxFit.contain),
          Gap(16.w),
          Assets.images.icBell.image(fit: BoxFit.contain),
          Gap(16.w),
          InkWell(
            onTap: () => context.router.push(const SettingRoute()),
            child: Assets.images.icMenu.image(fit: BoxFit.contain),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Gap(10.h),
              const PointRewardView(),
              Gap(20.h),
              const EventView(),
              Gap(28.h),
              const FeedView(),
              Gap(24.h),
              const MenuView(),
              Gap(37.h),
              AppListItemBody(
                icon: SizedBox.square(
                  dimension: 43,
                  child: Assets.images.icCalendarCheck.image(),
                ),
                title: '매일매일 출석체크!',
                subTitle: '최대 1,000P의 행운!',
                color: const Color(0xff3D4046),
              ),
              Gap(12.h),
              AppListItemBody(
                icon: SizedBox.square(
                  dimension: 43,
                  child: Assets.images.icTodayQuiz.image(),
                ),
                title: '오늘의 퀴즈',
                subTitle: '오전 10시, 맞히면 10P',
                color: DemoColors.primaryBoxColor,
              ),
              Gap(12.h),
              const WatchRewardView(),
              Gap(24.h),
              const SpecialPriceView(),
              Gap(30.h),
              const AcadeView(),
              Gap(20.h),
              const SeasonEventView(),
              Gap(12.h),
            ],
          ),
        ),
      ),
    );
  }
}
