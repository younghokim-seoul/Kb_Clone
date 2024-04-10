import 'package:flutter/material.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';

/// Text styles used in the demo.
abstract class DemoTextStyles {
  /// Creates a [TextTheme] from the text styles.
  static TextTheme get textTheme => const TextTheme(
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    bodyLarge: bodyLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );

  /// Headline large text style.
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: DemoColors.primaryColor,
  );

  /// Headline medium text style.
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: DemoColors.primaryColor,
  );

  /// Body large text style.
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: DemoColors.primaryColor,
  );

  /// Title large text style.
  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: DemoColors.primaryColor,
  );

  /// Title medium text style.
  static const TextStyle titleMedium = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: DemoColors.grey,
  );

  /// Label medium text style.
  static const TextStyle labelMedium = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: DemoColors.primaryColor,
  );

  /// Label small text style.
  static const TextStyle labelSmall = TextStyle(
    fontFamily: 'PlusJakartaSans',
    fontWeight: FontWeight.w500,
    fontSize: 10,
    letterSpacing: 0.3,
    color: DemoColors.primaryColor,
  );
}