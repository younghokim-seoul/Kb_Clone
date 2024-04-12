import 'package:flutter/material.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';

class DemoShadows {
  const DemoShadows._({
    required this.shadow1,
    required this.shadow2,
    required this.shadow3,
    required this.shadow4,
  });

  /// Shadow 1
  final BoxShadow shadow1;

  /// Shadow 2
  final BoxShadow shadow2;

  /// Shadow 3
  final BoxShadow shadow3;

  /// Shadow 4
  final BoxShadow shadow4;

  /// Shadows for the dark theme.
  static const dark = DemoShadows._(
    shadow1: BoxShadow(
      color: DemoColors.darkShadow1,
      blurRadius: 8,
      offset: Offset(0, 1),
    ),
    shadow2: BoxShadow(
      color: DemoColors.darkShadow2,
      blurRadius: 12,
      offset: Offset(0, 2),
    ),
    shadow3: BoxShadow(
      color: DemoColors.darkShadow3,
      blurRadius: 16,
      offset: Offset(0, 2),
    ),
    shadow4: BoxShadow(
      color: DemoColors.darkShadow4,
      blurRadius: 48,
      offset: Offset(0, 15),
    ),
  );

  /// Linearly interpolate between two shadows.
  // ignore: prefer_constructors_over_static_methods
  static DemoShadows lerp(
    DemoShadows a,
    DemoShadows b,
    double t,
  ) {
    return DemoShadows._(
      shadow1: BoxShadow.lerp(a.shadow1, b.shadow1, t)!,
      shadow2: BoxShadow.lerp(a.shadow2, b.shadow2, t)!,
      shadow3: BoxShadow.lerp(a.shadow3, b.shadow3, t)!,
      shadow4: BoxShadow.lerp(a.shadow4, b.shadow4, t)!,
    );
  }
}
