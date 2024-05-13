import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/feature/widget/labeled_input_field.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

class UsageFormRevolving extends ConsumerStatefulWidget {
  const UsageFormRevolving({
    required this.revolvingUsageAmount,
    required this.revolvingTransactionAmount,
    required this.revolvingRewardPoints,
    super.key,
  });

  final TextEditingController revolvingUsageAmount;
  final TextEditingController revolvingTransactionAmount;
  final TextEditingController revolvingRewardPoints;

  @override
  ConsumerState createState() => _UsageFormRevolvingState();
}

class _UsageFormRevolvingState extends ConsumerState<UsageFormRevolving> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledInputField(
          controller: widget.revolvingUsageAmount,
          label: '사용금액',
          hintText: '사용금액 입력',
          keyboardType: TextInputType.text,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.revolvingTransactionAmount,
          label: '이용금액',
          hintText: '이용금액 입력',
          keyboardType: TextInputType.text,
        ),
        Gap(24.h),
        LabeledInputField(
          controller: widget.revolvingRewardPoints,
          label: '적립',
          hintText: '적립 입력',
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
