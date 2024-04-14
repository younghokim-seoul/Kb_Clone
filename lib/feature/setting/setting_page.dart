import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/home/component/event_view.dart';
import 'package:kb_bank_clone/feature/home/component/feed_view.dart';
import 'package:kb_bank_clone/feature/home/component/menu_view.dart';
import 'package:kb_bank_clone/feature/home/component/point_reward_view.dart';
import 'package:kb_bank_clone/feature/home/component/watch_reward_view.dart';
import 'package:kb_bank_clone/feature/widget/app_list_item_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  static const routeName = '/setting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        actions: [
          SizedBox.square(
            dimension: 28,
            child: Assets.images.icMySearch.image(fit: BoxFit.contain),
          ),
          Gap(16.w),
          SizedBox.square(
            dimension: 28,
            child: Assets.images.icHome.image(fit: BoxFit.contain),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
