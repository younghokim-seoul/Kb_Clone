import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';

final routerProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});