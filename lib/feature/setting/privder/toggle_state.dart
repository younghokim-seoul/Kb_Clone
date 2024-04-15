import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleProvider = StateProvider.autoDispose<ToggleType>((ref) {
  return ToggleType.pay;
});

enum ToggleType {
  pay,
  card,
}