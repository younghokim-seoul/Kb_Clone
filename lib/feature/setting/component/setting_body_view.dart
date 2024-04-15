import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/setting/component/my_payment_selected_bar.dart';
import 'package:kb_bank_clone/feature/setting/component/my_setting_view.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

class SettingBodyView extends StatelessWidget {
  const SettingBodyView({required this.items, required this.title, super.key});

  final List<String> items;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: DemoTextStyles.labelMedium.copyWith(
                  color: DemoColors.primaryDivideColor, fontSize: 14, fontWeight: FontWeight.w400, height: 1.1),
            ),
            Gap(12.w),
            Expanded(child: Container(height: 1, color: DemoColors.white)),
          ],
        ),
        Gap(24.h),
        Wrap(
          spacing: 14.w,
          runSpacing: 22.h,
          children: items
              .map(
                (e) => InkWell(
                  onTap: () => {
                    if (e == "카드이용내역") {context.router.push(const CardUsageDetailsRoute())}
                  },
                  child: SizedBox(
                      width: 1.sw,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              e,
                              style: DemoTextStyles.labelMedium.copyWith(
                                color: DemoColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1,
                              ),
                            ),
                          ),
                          SizedBox.square(
                            dimension: 20,
                            child: Assets.images.icPin.image(),
                          )
                        ],
                      )),
                ),
              )
              .toList(),
        ),
        Gap(40.h),
      ],
    );
  }
}
