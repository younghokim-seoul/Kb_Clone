import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/app_card_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Flexible(
            child: AppCardBody.large(
              title: '금융',
              icon: Assets.images.icFinance.image(),
            ),
          ),
          Flexible(
            child: AppCardBody.large(
              title: '국민지갑',
              icon: Assets.images.icWallet.image(),
            ),
          ),
          Flexible(
            child: AppCardBody.large(
              title: '주식',
              icon: Assets.images.icKbStock.image(),
            ),
          ),
          Flexible(
            child: AppCardBody.large(
              title: '쿠폰함',
              icon: Assets.images.icCoupon.image(),
            ),
          ),
        ],
      ),
    );
  }
}
