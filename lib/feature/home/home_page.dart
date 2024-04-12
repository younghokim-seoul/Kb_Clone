import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Log.d("::HomePage");
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        leading: SizedBox.square(
          dimension: 72,
          child: Material(
            type: MaterialType.transparency,
            child: Center(child: Assets.images.titleLog.image(fit: BoxFit.contain)),
          ),
        ),
        actions: [
          Assets.images.icMyPage.image(fit: BoxFit.contain),
          Gap(16.w),
          Assets.images.icSearch.image(fit: BoxFit.contain),
          Gap(16.w),
          Assets.images.icBell.image(fit: BoxFit.contain),
          Gap(16.w),
          Assets.images.icMenu.image(fit: BoxFit.contain)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(10),
            _buildPointReward(),
          ],
        ),
      ),
    );
  }

  Widget _buildPointReward() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: DemoColors.yellow,
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: Image.asset('assets/images/main_banner.png'),
    );
  }
}
