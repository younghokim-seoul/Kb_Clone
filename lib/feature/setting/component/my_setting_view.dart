import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/widget/app_card_body.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class MySettingView extends StatelessWidget {
  const MySettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Flexible(
            child: AppCardBody.medium(
              title: '내 정보',
              icon: Assets.images.icMyProfile.image(),
            ),
          ),
          Flexible(
            child: AppCardBody.medium(
              title: '고객센터',
              icon: Assets.images.icCustomerServic.image(),
            ),
          ),
          Flexible(
            child: AppCardBody.medium(
              title: '이벤트',
              icon: Assets.images.icMyEvent.image(),
            ),
          ),
          Flexible(
            child: AppCardBody.medium(
              title: '설정',
              icon: Assets.images.icMySetting.image(),
            ),
          ),
        ],
      ),
    );
  }
}
