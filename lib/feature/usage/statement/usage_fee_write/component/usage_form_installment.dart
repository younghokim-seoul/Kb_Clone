import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/feature/widget/labeled_input_field.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

class UsageFormInstallment extends ConsumerStatefulWidget {
  const UsageFormInstallment({
    required this.installmentStartController,
    required this.installmentEndController,
    required this.interestFreeBenefitController,
    required this.installmentUsageAmountController,
    required this.installmentcommissionOrInterestController,
    required this.installmentTransactionAmountController,
    required this.installmentbalanceAfterPaymentController,
    super.key,
  });

  final TextEditingController installmentStartController;
  final TextEditingController installmentEndController;
  final TextEditingController interestFreeBenefitController;
  final TextEditingController installmentUsageAmountController;
  final TextEditingController installmentcommissionOrInterestController;
  final TextEditingController installmentTransactionAmountController;
  final TextEditingController installmentbalanceAfterPaymentController;

  @override
  ConsumerState createState() => _UsageFormInstallmentState();
}

class _UsageFormInstallmentState extends ConsumerState<UsageFormInstallment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: LabeledInputField(
                controller: widget.installmentStartController,
                label: '할부 개월수',
                hintText: '할부 입력',
                keyboardType: TextInputType.text,
              ),
            ),
            Gap(16.w),
            Expanded(
              child: LabeledInputField(
                controller: widget.installmentEndController,
                label: '전체 할부',
                hintText: '전체 할부 입력',
                keyboardType: TextInputType.text,
              ),
            )
          ],
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.interestFreeBenefitController,
          label: '무이자 혜택',
          hintText: '무이자 혜택 입력',
          keyboardType: TextInputType.text,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.installmentUsageAmountController,
          label: '원금',
          hintText: '원금 입력',
          keyboardType: TextInputType.text,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.installmentcommissionOrInterestController,
          label: '수수료(이자)',
          hintText: '수수료(이자) 입력',
          keyboardType: TextInputType.text,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.installmentTransactionAmountController,
          label: '이용금액',
          hintText: '이용금액 입력',
          keyboardType: TextInputType.text,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.installmentbalanceAfterPaymentController,
          label: '결제후 잔액',
          hintText: '결제후 잔액 입력',
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
