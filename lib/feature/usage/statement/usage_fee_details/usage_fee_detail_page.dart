import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/di/app_provider.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_view_model.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';
import 'package:kb_bank_clone/utils/extension/value_extension.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

@RoutePage()
class UsageFeeDetailsPage extends ConsumerStatefulWidget {
  const UsageFeeDetailsPage({super.key});

  static const routeName = '/usage_fee_details';

  @override
  ConsumerState createState() => _UsageFeeDetailsPageState();
}

class _UsageFeeDetailsPageState extends ConsumerState<UsageFeeDetailsPage> {
  late UsageFeeDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(usageFeeDetailViewModelProvider);
    _viewModel.collectCardTransactions(
        DateTime.now().month.toString().padLeft(2, '0'));
  }

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
      floatingActionButton: InkWell(
        onTap: () => context.router.push(const UsageFeeWriteRoute()),
        child: Container(
          width: 1.sw,
          height: 56.h,
          color: DemoColors.primaryColor,
          alignment: Alignment.center,
          child: Text(
            '전체내역보기',
            style: DemoTextStyles.labelSmall.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '전체',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Assets.images.icArrowDown.image(fit: BoxFit.cover),
            ],
          ),
          Gap(17.h),
          Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '총',
                  style: DemoTextStyles.labelSmall.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    WidgetSpan(child: SizedBox(width: 5.w)),
                    TextSpan(text: '3', style: TextStyle(color: Colors.red)),
                    TextSpan(text: '건'),
                  ],
                ),
              ),
              Text(
                '${2000000.toCurrency()}원',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Gap(25.h),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }
}
