import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
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
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/feature/widget/usage_item_body.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

@RoutePage()
class UsageFeeStatementPage extends ConsumerWidget {
  const UsageFeeStatementPage({super.key});

  static const routeName = '/usage_fee_statement';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.pop(),
        ),
        title: "이용대금명세서",
        actions: [
          InkWell(
            onTap: () => context.router.push(const SettingRoute()),
            child: Assets.images.icMenu.image(fit: BoxFit.cover),
          )
        ],
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
