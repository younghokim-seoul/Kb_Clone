// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CardUsageDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CardUsageDetailsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    UsageFeeDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsageFeeDetailsPage(),
      );
    },
    UsageFeeStatementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsageFeeStatementPage(),
      );
    },
    UsageFeeWriteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsageFeeWritePage(),
      );
    },
  };
}

/// generated route for
/// [CardUsageDetailsPage]
class CardUsageDetailsRoute extends PageRouteInfo<void> {
  const CardUsageDetailsRoute({List<PageRouteInfo>? children})
      : super(
          CardUsageDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardUsageDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsageFeeDetailsPage]
class UsageFeeDetailsRoute extends PageRouteInfo<void> {
  const UsageFeeDetailsRoute({List<PageRouteInfo>? children})
      : super(
          UsageFeeDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsageFeeDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsageFeeStatementPage]
class UsageFeeStatementRoute extends PageRouteInfo<void> {
  const UsageFeeStatementRoute({List<PageRouteInfo>? children})
      : super(
          UsageFeeStatementRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsageFeeStatementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsageFeeWritePage]
class UsageFeeWriteRoute extends PageRouteInfo<void> {
  const UsageFeeWriteRoute({List<PageRouteInfo>? children})
      : super(
          UsageFeeWriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsageFeeWriteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
