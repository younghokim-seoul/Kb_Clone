import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/feature/setting/component/my_payment_selected_bar.dart';
import 'package:kb_bank_clone/feature/setting/component/my_setting_view.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';

class SettingHeaderView extends StatelessWidget {
  const SettingHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20.h),
        const MySettingView(),
        Gap(32.h),
        const MyPaymentSelectedBar(),
        Gap(24.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(height: 2.h, color: DemoColors.white),
                  ),
                  Text(
                    '최근',
                    style: DemoTextStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1,
                      color: DemoColors.grey,
                    ),
                  ).paddingOnly(bottom: 8.h),
                ],
              ),
            ),
            Gap(20.w),
            Text(
              '즐겨찾기',
              style: DemoTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1,
                color: DemoColors.grey,
              ),
            ).paddingOnly(bottom: 8.h)
          ],
        ).paddingSymmetric(horizontal: 12),

        Text(
          '최근 방문한 메뉴가 없습니다.',
          style: DemoTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1,
            color: DemoColors.primaryDivideColor,
          ),
        ).paddingSymmetric(vertical: 35.h)
      ],
    );
  }
}
