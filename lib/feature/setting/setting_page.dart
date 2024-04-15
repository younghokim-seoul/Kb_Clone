import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/feature/setting/component/setting_body_view.dart';
import 'package:kb_bank_clone/feature/setting/component/setting_header_view.dart';
import 'package:kb_bank_clone/feature/setting/model/setting_items.dart';
import 'package:kb_bank_clone/feature/setting/privder/toggle_state.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  static const routeName = '/setting';

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.zero,
                sliver: SliverToBoxAdapter(child: SettingHeaderView()),
              ),
              _buildDisplayView(),
            ],
          )),
    );
  }

  Widget _buildDisplayView() {
    return Consumer(builder: (context, ref, _) {
      final state = ref.watch(toggleProvider);
      final items = (state == ToggleType.pay ? kbPayDisplayMap : cardDisplayMap).entries.toList();

      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        sliver: SliverList.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final model = items[index];
            return SettingBodyView(
              key: ValueKey(index),
              title: model.key,
              items: model.value,
            );
          },
        ),
      );
    });
  }
}
