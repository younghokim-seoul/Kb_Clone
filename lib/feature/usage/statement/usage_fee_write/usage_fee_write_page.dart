import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/data/local/vo/transaction_type.dart';
import 'package:kb_bank_clone/di/app_provider.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/component/usage_form_annual.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/component/usage_form_installment.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/component/usage_form_revolving.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_write/usage_fee_write_view_model.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/feature/widget/labeled_input_field.dart';
import 'package:kb_bank_clone/main.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';
import 'package:kb_bank_clone/utils/global/payment_add_event.dart';

final dateSelectedProvider = StateProvider.autoDispose<DateTime?>((ref) {
  return null;
});

final selectedTransactionTypeProvider = StateProvider.autoDispose<TransactionType>((ref) {
  return TransactionType.revolving;
});

@RoutePage()
class UsageFeeWritePage extends ConsumerStatefulWidget {
  const UsageFeeWritePage({
    required this.selectedYear,
    required this.selectedMonth,
    super.key,
  });

  static const routeName = '/usage_fee_write';
  final int selectedYear;
  final int selectedMonth;

  @override
  ConsumerState createState() => _UsageFeeWritePageState();
}

class _UsageFeeWritePageState extends ConsumerState<UsageFeeWritePage> {
  late UsageFeeWriteViewModel _viewModel;
  late TextEditingController _merchantNameController;
  late TextEditingController _dateController;

  late TextEditingController _revolvingUsageAmount;
  late TextEditingController _revolvingTransactionAmount;
  late TextEditingController _revolvingRewardPoints;

  late TextEditingController installmentStartController;
  late TextEditingController installmentEndController;
  late TextEditingController interestFreeBenefitController;
  late TextEditingController installmentUsageAmountController;
  late TextEditingController installmentcommissionOrInterestController;
  late TextEditingController installmentTransactionAmountController;
  late TextEditingController installmentbalanceAfterPaymentController;

  late TextEditingController annualUsageAmount;
  late TextEditingController annualTransactionAmount;

  DateTime? selectedDate;

  bool isValidField(TransactionType type) {
    // 공통 필드 유효성 검사

    Log.d("type $type");
    final isCommonValid =
        _merchantNameController.text.isNotEmpty && _dateController.text.isNotEmpty && selectedDate != null;

    // 트랜잭션 유형에 따른 필드 유효성 검사
    bool isTypeValid = false;
    switch (type) {
      case TransactionType.revolving:
        isTypeValid = _revolvingUsageAmount.text.isNotEmpty &&
            _revolvingTransactionAmount.text.isNotEmpty &&
            _revolvingRewardPoints.text.isNotEmpty;
        break;
      case TransactionType.installment:
        isTypeValid = installmentStartController.text.isNotEmpty &&
            installmentEndController.text.isNotEmpty &&
            interestFreeBenefitController.text.isNotEmpty &&
            installmentUsageAmountController.text.isNotEmpty &&
            installmentcommissionOrInterestController.text.isNotEmpty &&
            installmentTransactionAmountController.text.isNotEmpty &&
            installmentbalanceAfterPaymentController.text.isNotEmpty;
        break;
      case TransactionType.annual:
        isTypeValid = annualUsageAmount.text.isNotEmpty && annualTransactionAmount.text.isNotEmpty;
        break;
    }
    // 공통 필드와 트랜잭션 유형 필드 모두 유효한 경우에만 true 반환
    return isCommonValid && isTypeValid;
  }

  CardTransactionEntity createEntity(TransactionType type) {
    final entity = CardTransactionEntity.empty().copyWith(
      merchantName: _merchantNameController.text,
      createAt: DateTime(widget.selectedYear, widget.selectedMonth),
      displayDateTime: selectedDate!,
    );

    switch (type) {
      case TransactionType.revolving:
        return entity.copyWith(
          usageAmount: int.parse(_revolvingUsageAmount.text),
          transactionAmount: int.parse(_revolvingTransactionAmount.text),
          rewardPoints: int.parse(_revolvingRewardPoints.text),
          transactionType: type,
        );
      case TransactionType.installment:
        return entity.copyWith(
          installmentStart: int.parse(installmentStartController.text),
          installmentEnd: int.parse(installmentEndController.text),
          interestFreeBenefit: int.parse(interestFreeBenefitController.text),
          usageAmount: int.parse(installmentUsageAmountController.text),
          commissionOrInterest: int.parse(installmentcommissionOrInterestController.text),
          transactionAmount: int.parse(installmentTransactionAmountController.text),
          balanceAfterPayment: int.parse(installmentbalanceAfterPaymentController.text),
          transactionType: type,
        );
      case TransactionType.annual:
        return entity.copyWith(
          usageAmount: int.parse(annualUsageAmount.text),
          transactionAmount: int.parse(annualTransactionAmount.text),
          transactionType: type,
        );
    }
  }

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(usageFeeWriteViewModelProvider);
    _dateController = TextEditingController();
    _merchantNameController = TextEditingController();


    _revolvingUsageAmount = TextEditingController();
    _revolvingTransactionAmount = TextEditingController();
    _revolvingRewardPoints = TextEditingController();

    installmentStartController = TextEditingController();
    installmentEndController = TextEditingController();
    interestFreeBenefitController = TextEditingController();
    installmentUsageAmountController = TextEditingController();
    installmentcommissionOrInterestController = TextEditingController();
    installmentTransactionAmountController = TextEditingController();
    installmentbalanceAfterPaymentController = TextEditingController();

    annualUsageAmount = TextEditingController();
    annualTransactionAmount = TextEditingController();
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
            LabeledInputField(
              controller: _merchantNameController,
              label: '상호명',
              hintText: '상호명을 입력해주세요.',
              keyboardType: TextInputType.text,
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
                    );
                  },
                ),
                Positioned(
                  right: 10.w,
                  bottom: 12.h,
                  child: InkWell(
                    onTap: () {
                      final firstDayOfMonth = DateTime(widget.selectedYear, widget.selectedMonth);
                      final lastDayOfMonth = DateTime(widget.selectedYear, widget.selectedMonth + 1).subtract(
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
                          initialDateTime: DateTime(widget.selectedYear, widget.selectedMonth),
                          mode: CupertinoDatePickerMode.date,
                          minimumYear: widget.selectedYear - 3,
                          maximumYear: widget.selectedYear + 3,
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
            _buildTransactionButton(),
            Gap(24.h),
            _buildForm(),
            Gap(24.h),
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
                    onTap: () async {
                      final transactionType = ref.read(selectedTransactionTypeProvider);
                      if (!isValidField(transactionType)) {
                        Log.e('::::공백존재.. return');
                        return;
                      }

                      try {
                        final entity = createEntity(transactionType);
                        await _viewModel.insertCardTransaction(entity);
                        Log.d(':::save... success');
                        if (context.mounted) {
                          eventBus.fire(const PaymentAddEvent());
                          context.router.popForced();
                        }
                      } catch (e) {
                        Log.e(":::save fail.. $e");
                      }
                    },
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
        ),
      ),
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

  Widget _buildForm() {
    return Consumer(
      builder: (context, watch, child) {
        final transactionType = ref.watch(selectedTransactionTypeProvider);

        switch (transactionType) {
          case TransactionType.revolving:
            return UsageFormRevolving(
              revolvingUsageAmount: _revolvingUsageAmount,
              revolvingTransactionAmount: _revolvingTransactionAmount,
              revolvingRewardPoints: _revolvingRewardPoints,
            );
          case TransactionType.installment:
            return UsageFormInstallment(
              installmentStartController: installmentStartController,
              installmentEndController: installmentEndController,
              interestFreeBenefitController: interestFreeBenefitController,
              installmentUsageAmountController: installmentUsageAmountController,
              installmentcommissionOrInterestController: installmentcommissionOrInterestController,
              installmentTransactionAmountController: installmentTransactionAmountController,
              installmentbalanceAfterPaymentController: installmentbalanceAfterPaymentController,
            );
          case TransactionType.annual:
            return UsageFormAnnual(
              annualUsageAmount: annualUsageAmount,
              annualTransactionAmount: annualTransactionAmount,
            );
        }
      },
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
            selectedDate = selectedDate ??
                DateTime(
                  widget.selectedYear,
                  widget.selectedMonth,
                );
            ref.read(dateSelectedProvider.notifier).state = selectedDate;
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
      ),
    );
  }

  Widget _buildTransactionButton() {
    return Row(
      children: [
        Expanded(
            child: InkWell(
          onTap: () => ref.read(selectedTransactionTypeProvider.notifier).state = TransactionType.revolving,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: ref.watch(selectedTransactionTypeProvider) == TransactionType.revolving
                  ? DemoColors.primaryYellowLightColor
                  : DemoColors.white,
            ),
            child: Text(
              '리볼빙 일시불',
              textAlign: TextAlign.center,
              style: DemoTextStyles.headlineMedium.copyWith(
                color: DemoColors.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ).paddingSymmetric(vertical: 10.h),
          ),
        )),
        Gap(12.w),
        Expanded(
          child: InkWell(
            onTap: () => ref.read(selectedTransactionTypeProvider.notifier).state = TransactionType.installment,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: ref.watch(selectedTransactionTypeProvider) == TransactionType.installment
                    ? DemoColors.primaryYellowLightColor
                    : DemoColors.white,
              ),
              child: Text(
                '할부',
                textAlign: TextAlign.center,
                style: DemoTextStyles.headlineMedium.copyWith(
                  color: DemoColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingSymmetric(vertical: 10.h),
            ),
          ),
        ),
        Gap(12.w),
        Expanded(
          child: InkWell(
            onTap: () => ref.read(selectedTransactionTypeProvider.notifier).state = TransactionType.annual,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: ref.watch(selectedTransactionTypeProvider) == TransactionType.annual
                    ? DemoColors.primaryYellowLightColor
                    : DemoColors.white,
              ),
              child: Text(
                '연회비',
                textAlign: TextAlign.center,
                style: DemoTextStyles.headlineMedium.copyWith(
                  color: DemoColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ).paddingSymmetric(vertical: 10.h),
            ),
          ),
        ),
      ],
    );
  }
}
