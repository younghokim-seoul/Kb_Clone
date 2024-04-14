import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class SpecialPriceView extends StatelessWidget {
  const SpecialPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          Gap(10.w),
          Expanded(
            child: Text(
              '생생한 4K급 해상도\n24 UHD TV 특가',
              style: DemoTextStyles.bodyLarge.copyWith(color: DemoColors.grey),
            ),
          ),
          SizedBox.square(
            dimension: 72,
            child: Assets.images.icTv.image(),
          )
        ],
      ),
    );
  }
}
