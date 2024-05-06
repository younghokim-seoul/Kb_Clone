import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/feature/widget/labeled_input_field.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

class UsageFormAnnual extends ConsumerStatefulWidget {
  const UsageFormAnnual({
    required this.annualUsageAmount,
    required this.annualTransactionAmount,
    super.key,
  });

  final TextEditingController annualUsageAmount;
  final TextEditingController annualTransactionAmount;

  @override
  ConsumerState createState() => _UsageFormAnnualState();
}

class _UsageFormAnnualState extends ConsumerState<UsageFormAnnual> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledInputField(
          controller: widget.annualUsageAmount,
          label: '사용금액',
          hintText: '사용금액 입력',
          keyboardType: TextInputType.number,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.annualTransactionAmount,
          label: '이용금액',
          hintText: '이용금액 입력',
          keyboardType: TextInputType.number,
        ),
        Gap(24.h),
      ],
    );
  }
}
