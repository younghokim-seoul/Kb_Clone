import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';

@RoutePage()
class UsageFeeDetailsPage extends ConsumerStatefulWidget {
  const UsageFeeDetailsPage({super.key});

  static const routeName = '/usage_fee_details';

  @override
  ConsumerState createState() => _UsageFeeDetailsPageState();
}

class _UsageFeeDetailsPageState extends ConsumerState<UsageFeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "이용대금상세내역",
        actions: [
          InkWell(
            onTap: () => context.router.popForced(),
            child: Assets.images.icClose.image(fit: BoxFit.cover),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverToBoxAdapter(child: _buildUsageFeeHeader()),
          ),
        ],
      ),
    );
  }

  Widget _buildUsageFeeHeader() {
    return DecoratedBox(
      decoration: const BoxDecoration(color: DemoColors.primaryBoxColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(22.h),
          Row(
            children: [
              Text(
                '이용내역상세',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(6.w),
              Assets.images.icGuide.image(fit: BoxFit.cover),
            ],
          ),
          Gap(24.h),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
