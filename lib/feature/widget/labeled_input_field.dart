import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kb_bank_clone/theme/theme.dart';

class LabeledInputField extends StatefulWidget {
  const LabeledInputField({
    required this.label,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.hintText,
    this.errorText,
    this.onChanged,
    this.enabled = true,
    this.fwMode = false,
    this.onClear,
    super.key,
  });

  final String label;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final TextInputType? keyboardType;

  final String? hintText;

  final String? errorText;

  final ValueChanged<String>? onChanged;

  final bool enabled;

  final bool fwMode;

  final VoidCallback? onClear;

  bool get hasError => errorText != null && errorText!.isNotEmpty;

  @override
  State<LabeledInputField> createState() => _LabeledInputFieldState();
}

class _LabeledInputFieldState extends State<LabeledInputField> {
  late final _internalFocusNode = FocusNode();
  late final _internalController = TextEditingController();

  FocusNode get _effectiveFocusNode => widget.focusNode ?? _internalFocusNode;

  TextEditingController get _effectiveController => widget.controller ?? _internalController;

  @override
  void dispose() {
    _internalFocusNode.dispose();
    _internalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Text(
            widget.label,
            style: DemoTextStyles.bodyLarge.copyWith(color: DemoColors.grey, fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            TextField(
              focusNode: _effectiveFocusNode,
              controller: _effectiveController,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: DemoTextStyles.bodyLarge.copyWith(
                  color: DemoColors.primaryBoxGreyColorLight,
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.w800,
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: DemoColors.primaryBoxColorLight,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: DemoColors.primaryBoxColorLight,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: DemoColors.primaryBoxColorLight,
                  ),
                ),
                isCollapsed: true,
                suffixIcon: RepaintBoundary(
                  child: ListenableBuilder(
                    listenable: _effectiveController,
                    builder: (context, _) {
                      return AnimatedOpacity(
                        opacity: _effectiveController.text.isEmpty ? 0 : 1,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeInOut,
                        child: GestureDetector(
                          child: widget.enabled
                              ? const Icon(
                                  CupertinoIcons.clear,
                                  size: 24,
                                  color: DemoColors.grey,
                                )
                              : const SizedBox.square(dimension: 24),
                          onTap: () {
                            if (widget.enabled) {
                              _effectiveFocusNode.requestFocus();
                              _effectiveController.clear();
                              widget.onClear?.call();
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              enabled: widget.enabled,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: widget.fwMode,
              textAlignVertical: TextAlignVertical.center,
              style: DemoTextStyles.bodyLarge.copyWith(
                color: DemoColors.grey,
                fontSize: 16,
                height: 1,
                fontWeight: FontWeight.w800,
              ),
              cursorColor: DemoColors.grey,
              cursorRadius: const Radius.circular(2),
              cursorWidth: 1.5,
              onChanged: (value) {
                final onChanged = widget.onChanged;

                if (onChanged == null) {
                  return;
                }

                onChanged(value);
              },
            ),
          ],
        ),
      ],
    );
  }
}
