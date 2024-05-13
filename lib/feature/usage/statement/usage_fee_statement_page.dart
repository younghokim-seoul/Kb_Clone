import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/di/app_provider.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_statement_view_model.dart';
import 'package:kb_bank_clone/feature/widget/appbar/custom_app_bar.dart';
import 'package:kb_bank_clone/feature/widget/appbar/flex_icon_button.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';
import 'package:kb_bank_clone/utils/extension/margin_extension.dart';
import 'package:kb_bank_clone/utils/extension/value_extension.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';

@RoutePage()
class UsageFeeStatementPage extends ConsumerStatefulWidget {
  const UsageFeeStatementPage({super.key});

  static const routeName = '/usage_fee_statement';

  @override
  ConsumerState createState() => _UsageFeeStatementPageState();
}

class _UsageFeeStatementPageState extends ConsumerState<UsageFeeStatementPage> {
  late UsageFeeStatementViewModel _viewModel;

  final initialDate = DateTime(2024, 4);
  TextEditingController? _effectiveController;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(usageFeeStatementViewModelProvider);
    _viewModel
      ..findAllCardTransactions(initialDate.year, initialDate.month)
      ..subScribePaymentEvent();
  }

  @override
  void dispose() {
    _viewModel.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        leading: FlexIconButton.medium(
          icon: CupertinoIcons.left_chevron,
          onPressed: () => context.router.popForced(),
        ),
        title: "이용대금명세서",
        actions: [
          Assets.images.icMenu.image(fit: BoxFit.contain),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              _buildHeader(),
              Gap(43.h),
              _buildTotalUsageFee(),
              Gap(65.h),
              _buildCardUsageFee(),
              Gap(10.h),
              _buildComment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return DecoratedBox(
      decoration: const BoxDecoration(color: DemoColors.primaryBoxColorLight),
      child: Row(
        children: [
          Gap(20.w),
          FlexIconButton.medium(
            icon: CupertinoIcons.left_chevron,
            onPressed: () => _viewModel.changeMonth(ChangeType.minus),
          ),
          Expanded(
            child: _viewModel.currentDateState.ui(
              builder: (context, state) {
                if (!state.hasData || state.data.isNullOrEmpty) {
                  return const SizedBox.shrink();
                }
                return Text(
                  DateFormat('yy년 M월 명세서').format(state.data!),
                  style: DemoTextStyles.labelSmall.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ).paddingSymmetric(vertical: 22.h);
              },
            ),
          ),
          FlexIconButton.medium(
            icon: CupertinoIcons.right_chevron,
            onPressed: () => _viewModel.changeMonth(ChangeType.plus),
          ),
          Gap(20.w),
        ],
      ),
    );
  }

  Widget _buildTotalUsageFee() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _viewModel.currentDateState.ui(builder: (context, state) {
              return Text(
                '작성기준일  ${formatWrittenDate(state.data)}',
                style: DemoTextStyles.labelSmall.copyWith(
                  color: DemoColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              );
            }),
            Gap(20.w),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                border: Border.all(color: DemoColors.grey, width: 1.w),
              ),
              child: Row(
                children: [
                  SizedBox.square(
                    dimension: 16.w,
                    child: Assets.images.icChart.image(fit: BoxFit.cover),
                  ),
                  Gap(12.w),
                  Text(
                    '소비 리포트',
                    style: DemoTextStyles.labelSmall.copyWith(
                      color: DemoColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
            )
          ],
        ),
        Gap(14.h),
        Row(
          children: [
            Text(
              '김현진',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              '의 총 이용대금',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            _viewModel.usageFeeStatementState.ui(
              builder: (context, state) {
                return FlutterSwitch(
                  width: 80,
                  height: 40,
                  valueFontSize: 18,
                  toggleSize: 30,
                  value: state.data?.isWrittenOff ?? false,
                  borderRadius: 30,
                  padding: 8,
                  activeColor: DemoColors.rewardColor,
                  onToggle: (val) {
                    _viewModel.toggle();
                  },
                );
              },
            ),
          ],
        ),
        Gap(12.h),
        _viewModel.usageFeeStatementState.ui(builder: (context, state) {
          return Text(
            '${state.data.isNullOrEmpty ? '' : state.data!.totalUsageFee.toCurrency()}원',
            style: DemoTextStyles.labelSmall.copyWith(
              color: DemoColors.rewardColor,
              fontSize: 36,
              height: 1,
              fontWeight: FontWeight.w800,
            ),
          );
        }),
      ],
    ).paddingSymmetric(horizontal: 24.w);
  }

  Widget _buildCardUsageFee() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DemoColors.primaryDivideColor, width: 1.w),
      ),
      child: SizedBox(
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(32.h),
            Text(
              '신용카드',
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(12.h),
            _viewModel.usageFeeStatementState.ui(
              builder: (context, state) {
                return Text(
                  '${state.data.isNullOrEmpty ? '' : state.data!.totalUsageFee.toCurrency()}원',
                  style: DemoTextStyles.labelSmall.copyWith(
                    color: DemoColors.grey,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                );
              },
            ),
            Gap(12.h),
            Row(
              children: [
                Text(
                  '최소결제금액',
                  style: DemoTextStyles.labelSmall.copyWith(
                    color: DemoColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Gap(4.w),
                _viewModel.minimumPaymentFee.ui(builder: (context, state) {
                  final defaluValue = state.data ?? 0;
                  _effectiveController = TextEditingController(text: '$defaluValue원');
                  return Expanded(
                      child: TextField(
                    controller: _effectiveController,
                    keyboardType: TextInputType.text,
                    style: DemoTextStyles.labelSmall.copyWith(
                      color: DemoColors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      isCollapsed: true,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: DemoColors.grey,
                          width: 1.w,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (!value.endsWith('원')) {
                        if (_effectiveController != null) {
                          _effectiveController!.text = '$value원';
                          _effectiveController!.selection = TextSelection.fromPosition(
                            TextPosition(offset: _effectiveController!.text.length - 1),
                          );
                        }
                      }

                      if (value.isNullOrEmpty) {
                        _viewModel.changeMinimumPayment(0);
                      }

                      if (value.endsWith('원')) {
                        try {
                          value = value.substring(0, value.length - 1);
                          _viewModel.changeMinimumPayment(int.parse(value));
                        } catch (e) {
                          _viewModel.changeMinimumPayment(0);
                        }
                      }
                    },
                  ));
                })
              ],
            ),
            Gap(24.h),
            Row(
              children: [
                InkWell(
                  onTap: () => context.router.push(
                    UsageFeeDetailsRoute(
                      selectedYear: _viewModel.getYear(),
                      selectedMonth: _viewModel.getMonth(),
                      isWrittenOff: _viewModel.isWrittenMode(),
                    ),
                  ),
                  child: _buildButton(title: '이용내역'),
                ),
                Gap(12.w),
                _buildButton(title: '카드별 이용금액'),
              ],
            ),
            Gap(20.h),
            Container(color: DemoColors.primaryDivideColor, height: 1.h),
            Gap(20.h),
            _buildSummary(),
            Gap(24.h),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    ).paddingSymmetric(horizontal: 16.w, vertical: 8.h);
  }

  Widget _buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _viewModel.currentDateState.ui(
          builder: (context, state) {
            if (!state.hasData || state.data.isNullOrEmpty) {
              return const SizedBox.shrink();
            }
            return Text(
              DateFormat('결제일 : yy.MM.27').format(state.data!),
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            );
          },
        ),
        Gap(12.h),
        _viewModel.currentDateState.ui(
          builder: (context, state) {
            if (!state.hasData || state.data.isNullOrEmpty) {
              return const SizedBox.shrink();
            }
            return Text(
              DateFormat('실제출금일 : yy.MM.27').format(state.data!),
              style: DemoTextStyles.labelSmall.copyWith(
                color: DemoColors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            );
          },
        ),
        Gap(12.h),
        Text(
          "결제계좌 : 기업은행 525040*****018",
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildComment() {
    return Text(
      '※ 작성기준일은 현재 장기카드 대출 결제금액이  연체되었다며 안내되지 않을 수 있습니다.',
      style: DemoTextStyles.labelSmall.copyWith(
        color: DemoColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ).paddingSymmetric(horizontal: 24.w);
  }

  Widget _buildButton({required String title}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: DemoColors.lightButtonLabelText,
      ),
      child: Center(
        child: Text(
          title,
          style: DemoTextStyles.labelSmall.copyWith(
            color: DemoColors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ).paddingSymmetric(horizontal: 32.w, vertical: 10.h),
    );
  }

  String formatWrittenDate(DateTime? writtenDate) {
    if (writtenDate == null) {
      return '';
    } else {
      return DateFormat('yy. M. 15').format(writtenDate);
    }
  }
}
