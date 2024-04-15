import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kb_bank_clone/feature/setting/privder/toggle_state.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';

class MyPaymentSelectedBar extends ConsumerWidget {
  const MyPaymentSelectedBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final payState = ref.watch(toggleProvider);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.5),
        color: DemoColors.primaryBoxColorLight,
      ),
      child: SizedBox(
          width: 1.sw * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        ref.read(toggleProvider.notifier).state = ToggleType.pay;
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.5),
                          color: payState == ToggleType.pay ? DemoColors.primaryBoxGreyColorLight : Colors.transparent,
                        ),
                        child: SizedBox(
                          height: 40.h,
                          child: Center(
                            child: Text(
                              'KB Pay',
                              textAlign: TextAlign.center,
                              style: DemoTextStyles.titleLarge.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.1,
                                color: DemoColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        ref.read(toggleProvider.notifier).state = ToggleType.card;
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21.5),
                          color: payState == ToggleType.card ? DemoColors.primaryBoxGreyColorLight : Colors.transparent,
                        ),
                        child: SizedBox(
                          height: 40.h,
                          child: Center(
                            child: Text(
                              '카드',
                              textAlign: TextAlign.center,
                              style: DemoTextStyles.titleLarge.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height: 1.1,
                                color: DemoColors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
