import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/di/app_provider.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/usage_fee_write_view_model.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/feature/widget/labeled_input_field.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';

final dateSelectedProvider = StateProvider.autoDispose<DateTime?>((ref) {
  return null;
});

@RoutePage()
class UsageFeeWritePage extends ConsumerStatefulWidget {
  const UsageFeeWritePage({super.key});

  static const routeName = '/usage_fee_write';

  @override
  ConsumerState createState() => _UsageFeeWritePageState();
}

class _UsageFeeWritePageState extends ConsumerState<UsageFeeWritePage> {
  late UsageFeeWriteViewModel _viewModel;
  late TextEditingController _dateController;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(usageFeeWriteViewModelProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "카드 입력 내역",
        actions: [
          InkWell(
            onTap: () => context.router.popForced(),
            child: Assets.images.icClose.image(fit: BoxFit.cover),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Gap(40.h),
            const LabeledInputField(
              label: '상호명',
              hintText: '상호명을 입력해주세요.',
              keyboardType: TextInputType.name,
            ),
            Gap(24.h),
            Stack(
              children: [
                Consumer(
                  builder: (context, watch, child) {
                    final selectedDate = ref.watch(dateSelectedProvider);
                    if (selectedDate != null) {
                      _dateController.text = DateFormat('yyyy.MM.dd').format(selectedDate);
                    } else {
                      _dateController.text = '';
                    }

                    return LabeledInputField(
                      controller: _dateController,
                      label: '날짜',
                      enabled: false,
                      hintText: '년, 월 일 순으로 기재',
                      keyboardType: TextInputType.name,
                    );
                  },
                ),
                Positioned(
                  right: 10.w,
                  bottom: 12.h,
                  child: InkWell(
                    onTap: () {
                      final today = DateTime.now();
                      final firstDayOfMonth = DateTime(today.year, today.month);
                      final lastDayOfMonth = DateTime(today.year, today.month + 1).subtract(
                        const Duration(days: 1),
                      );
                      _showDialog(CupertinoTheme(
                        data: CupertinoThemeData(
                          textTheme: CupertinoTextThemeData(
                            dateTimePickerTextStyle: DemoTextStyles.labelMedium.copyWith(
                              fontSize: 20,
                              color: DemoColors.grey,
                            ),
                          ),
                        ),
                        child: CupertinoDatePicker(
                          initialDateTime: today,
                          mode: CupertinoDatePickerMode.date,
                          minimumYear: today.year,
                          maximumYear: today.year,
                          minimumDate: firstDayOfMonth,
                          maximumDate: lastDayOfMonth,
                          onDateTimeChanged: (DateTime newDate) {
                            selectedDate = newDate;
                          },
                        ),
                      ));
                    },
                    child: SizedBox.square(
                      dimension: 24,
                      child: Assets.images.icCalendar.image(),
                    ),
                  ),
                ),
              ],
            ),
            Gap(24.h),
            LabeledInputField(
              label: '사용금액',
              hintText: '원단위 입력',
              keyboardType: TextInputType.number,
            ),
            Gap(24.h),
            LabeledInputField(
              label: '일시불/할부',
              hintText: '0개월',
              keyboardType: TextInputType.number,
            ),
            Gap(24.h),
            LabeledInputField(
              label: '적립 · 혜택',
              hintText: '원단위 입력',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Gap(24.w),
              Expanded(
                  child: InkWell(
                onTap: () => context.router.popForced(),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: DemoColors.white,
                  ),
                  child: Text(
                    '취소',
                    textAlign: TextAlign.center,
                    style: DemoTextStyles.headlineMedium.copyWith(
                      color: DemoColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ).paddingSymmetric(vertical: 15.h),
                ),
              )),
              Gap(12.w),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: DemoColors.primaryYellowLightColor,
                    ),
                    child: Text(
                      '저장',
                      textAlign: TextAlign.center,
                      style: DemoTextStyles.headlineMedium.copyWith(
                        color: DemoColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ).paddingSymmetric(vertical: 15.h),
                  ),
                ),
              ),
              Gap(24.w),
            ],
          ),
          Gap(24.h),
        ],
      )),
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: DemoColors.primaryBoxColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        height: 352.h,
        padding: EdgeInsets.only(top: 6.h),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: child),
              _buildButton(
                title: '확인',
                color: DemoColors.primaryYellowLightColor,
              ).marginSymmetric(horizontal: 16.w),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({required String title, Color? color}) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? DemoColors.primaryYellowLightColor,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              ref.read(dateSelectedProvider.notifier).state = selectedDate ?? DateTime.now();
              context.router.popForced();
            },
            child: Center(
              child: Text(
                title,
                style: DemoTextStyles.headlineMedium.copyWith(
                  color: DemoColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ).paddingSymmetric(horizontal: 32.w, vertical: 16.h),
          ),
        ));
  }
}