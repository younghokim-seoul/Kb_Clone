import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/data/local/vo/transaction_type.dart';
import 'package:kb_bank_clone/di/app_provider.dart';
import 'package:kb_bank_clone/domain/card_transaction_entity.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_state.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_view_model.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';
import 'package:kb_bank_clone/utils/extension/value_extension.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

@RoutePage()
class UsageFeeDetailsPage extends ConsumerStatefulWidget {
  const UsageFeeDetailsPage({
    required this.selectedYear,
    required this.selectedMonth,
    required this.isWrittenOff,
    super.key,
  });

  static const routeName = '/usage_fee_details';

  final int selectedYear;
  final int selectedMonth;
  final bool isWrittenOff;

  @override
  ConsumerState createState() => _UsageFeeDetailsPageState();
}

class _UsageFeeDetailsPageState extends ConsumerState<UsageFeeDetailsPage> {
  late UsageFeeDetailsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(usageFeeDetailViewModelProvider);
    _viewModel.collectCardTransactions(widget.selectedYear, widget.selectedMonth);
  }

  String getCardCode(DateTime targetTime) {
    final endOffset = DateTime(2023, 12,1);

    if (targetTime.isBefore(endOffset)) {
      return '마스터 005';
    } else {
      return '마스터 049';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        title: "이용대금상세내역",
        actions: [
          InkWell(
            onTap: () => context.router.popForced(),
            child: Assets.images.icClose.image(fit: BoxFit.cover),
          )
        ],
      ),
      body: _viewModel.uiState.ui(builder: (context, state) {
        return ListView.builder(
          primary: true,
          padding: EdgeInsets.zero,
          itemCount: state.data != null ? state.data!.items.length : 0,
          itemBuilder: (context, index) {
            final item = state.data!.items[index];

            if (item is CardTransactionHeader) {
              return _buildUsageFeeHeader(item);
            } else if (item is CardTransactionContent) {
              if (item.entity.transactionType == TransactionType.installment) {
                return _buildUsageUInstallmentContent(item.entity);
              }

              if (item.entity.transactionType == TransactionType.revolving) {
                return _buildUsageRevolvingContent(item.entity);
              }

              return _buildUsageAnnualContent(item.entity);
            } else if (item is CardTransactionFooter) {
              return _buildUsageFeeFooter(item);
            }
          },
        );
      }),
      floatingActionButton: widget.isWrittenOff
          ? null
          : InkWell(
              onTap: () => context.router.push(
                UsageFeeWriteRoute(
                  selectedYear: widget.selectedYear,
                  selectedMonth: widget.selectedMonth,
                ),
              ),
              splashColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                child: Assets.images.icFab.image(fit: BoxFit.contain, width: 48.w, height: 48.w),
              ),
            ),
    );
  }

  Widget _buildUsageFeeHeader(CardTransactionHeader item) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: DemoColors.primaryBoxColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(22.h),
          Row(
            children: [
              Text(
                '이용내역상세',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(6.w),
              Assets.images.icGuide.image(fit: BoxFit.cover),
            ],
          ),
          Gap(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '전체',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Assets.images.icArrowDown.image(fit: BoxFit.cover),
            ],
          ),
          Gap(17.h),
          Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '총',
                  style: DemoTextStyles.labelSmall.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    WidgetSpan(child: SizedBox(width: 5.w)),
                    TextSpan(text: item.transactionCount.toString(), style: TextStyle(color: Colors.red)),
                    TextSpan(text: '건'),
                  ],
                ),
              ),
              Text(
                '${item.totalFee.toCurrency()}원',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Gap(25.h),
        ],
      ).paddingSymmetric(horizontal: 16.w),
    );
  }

  Widget _buildUsageUInstallmentContent(CardTransactionEntity item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(24.h),
        Row(
          children: [
            Gap(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.merchantName,
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(16.h),
                Text(
                  "${DateFormat('yyyy.MM.dd').format(item.displayDateTime)} | 본인 | ${getCardCode(item.displayDateTime)} |",
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '할부 (${item.installmentStart}/${item.installmentEnd})',
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(8.h),
                Row(
                  children: [
                    Text(
                      '무이자 혜택',
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.rewardColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(4.w),
                    Text(
                      '-${item.interestFreeBenefit.toCurrency()}원',
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.primaryDivideColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "원금 ${item.usageAmount.toCurrency()}",
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(2.w),
                    Text(
                      "원",
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.primaryDivideColor,
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Text(
                  "수수료(이자) ${item.commissionOrInterest.toCurrency()}원",
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(6.h),
                Text(
                  "이용금액 ${item.transactionAmount.toCurrency()}원",
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(6.h),
                Text(
                  "결제후 잔액 ${item.balanceAfterPayment.toCurrency()}원",
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(6.h),
              ],
            ),
            Gap(16.w),
          ],
        ),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
      ],
    );
  }

  Widget _buildUsageRevolvingContent(CardTransactionEntity item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(24.h),
        Row(
          children: [
            Gap(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.merchantName,
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(16.h),
                Text(
                  "${DateFormat('yyyy.MM.dd').format(item.displayDateTime)} | 본인 | ${getCardCode(item.displayDateTime)} |",
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '리볼빙 일시불',
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(8.h),
                Row(
                  children: [
                    Text(
                      '적립',
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.rewardColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(4.w),
                    Text(
                      '${item.rewardPoints.toCurrency()}원',
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.primaryDivideColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      item.usageAmount.toCurrency(),
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(2.w),
                    Text(
                      "원",
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.primaryDivideColor,
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Text(
                  '이용금액 ${item.transactionAmount.toCurrency()}원',
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(6.h),
              ],
            ),
            Gap(16.w),
          ],
        ),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
      ],
    );
  }

  Widget _buildUsageAnnualContent(CardTransactionEntity item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(24.h),
        Row(
          children: [
            Gap(16.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.merchantName,
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(16.h),
                Text(
                  "${DateFormat('yyyy.MM.dd').format(item.displayDateTime)} | 본인 | ${getCardCode(item.displayDateTime)} |",
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '연회비',
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(8.h),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      item.usageAmount.toCurrency(),
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(2.w),
                    Text(
                      "원",
                      style: DemoTextStyles.bodyLarge.copyWith(
                        color: DemoColors.primaryDivideColor,
                        fontSize: 16,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(10.h),
                Text(
                  '이용금액 ${item.transactionAmount.toCurrency()}원',
                  style: DemoTextStyles.bodyLarge.copyWith(
                    color: DemoColors.primaryDivideColor,
                    fontSize: 14,
                    height: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(6.h),
              ],
            ),
            Gap(16.w),
          ],
        ),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
      ],
    );
  }

  Widget _buildUsageFeeFooter(CardTransactionFooter entity) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '본인회원 소 계 ${entity.transactionCount}건',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${entity.totalRewardAndMembershipFee.toCurrency()}원',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
        Gap(24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '합 계 ${entity.transactionCount}건',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${entity.totalRewardAndMembershipFee.toCurrency()}원',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
        Gap(24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '일부결제금액이월약정(리볼빙)',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${entity.revolvingSum.toCurrency()}원',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
        Gap(24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '신용카드 결제하실 총 금액',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${entity.totalSum.toCurrency()}원',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w),
        Gap(24.h),
        Container(color: DemoColors.primaryBoxColorLight, height: 1.h),
      ],
    );
  }
}
