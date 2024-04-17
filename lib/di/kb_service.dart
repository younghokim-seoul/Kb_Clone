import 'dart:async';

import 'package:get_it/get_it.dart';

final _locator = GetIt.asNewInstance();

T getService<T extends Object>({String? id}) => _locator<T>(instanceName: id);


void registerService<T extends Object>(
    T Function() create, {
      String? id,
      FutureOr<void> Function(T service)? dispose,
    }) {
  _locator.registerLazySingleton<T>(create, dispose: dispose, instanceName: id);
}

void registerServiceInstance<T extends Object>(T service, {String? id}) {
  _locator.registerSingleton<T>(service, instanceName: id);
}