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
      final args = routeData.argsAs<UsageFeeDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UsageFeeDetailsPage(
          selectedYear: args.selectedYear,
          selectedMonth: args.selectedMonth,
          isWrittenOff: args.isWrittenOff,
          key: args.key,
        ),
      );
    },
    UsageFeeStatementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsageFeeStatementPage(),
      );
    },
    UsageFeeWriteRoute.name: (routeData) {
      final args = routeData.argsAs<UsageFeeWriteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UsageFeeWritePage(
          selectedYear: args.selectedYear,
          selectedMonth: args.selectedMonth,
          key: args.key,
        ),
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
class UsageFeeDetailsRoute extends PageRouteInfo<UsageFeeDetailsRouteArgs> {
  UsageFeeDetailsRoute({
    required int selectedYear,
    required int selectedMonth,
    required bool isWrittenOff,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UsageFeeDetailsRoute.name,
          args: UsageFeeDetailsRouteArgs(
            selectedYear: selectedYear,
            selectedMonth: selectedMonth,
            isWrittenOff: isWrittenOff,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UsageFeeDetailsRoute';

  static const PageInfo<UsageFeeDetailsRouteArgs> page =
      PageInfo<UsageFeeDetailsRouteArgs>(name);
}

class UsageFeeDetailsRouteArgs {
  const UsageFeeDetailsRouteArgs({
    required this.selectedYear,
    required this.selectedMonth,
    required this.isWrittenOff,
    this.key,
  });

  final int selectedYear;

  final int selectedMonth;

  final bool isWrittenOff;

  final Key? key;

  @override
  String toString() {
    return 'UsageFeeDetailsRouteArgs{selectedYear: $selectedYear, selectedMonth: $selectedMonth, isWrittenOff: $isWrittenOff, key: $key}';
  }
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
class UsageFeeWriteRoute extends PageRouteInfo<UsageFeeWriteRouteArgs> {
  UsageFeeWriteRoute({
    required int selectedYear,
    required int selectedMonth,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UsageFeeWriteRoute.name,
          args: UsageFeeWriteRouteArgs(
            selectedYear: selectedYear,
            selectedMonth: selectedMonth,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UsageFeeWriteRoute';

  static const PageInfo<UsageFeeWriteRouteArgs> page =
      PageInfo<UsageFeeWriteRouteArgs>(name);
}

class UsageFeeWriteRouteArgs {
  const UsageFeeWriteRouteArgs({
    required this.selectedYear,
    required this.selectedMonth,
    this.key,
  });

  final int selectedYear;

  final int selectedMonth;

  final Key? key;

  @override
  String toString() {
    return 'UsageFeeWriteRouteArgs{selectedYear: $selectedYear, selectedMonth: $selectedMonth, key: $key}';
  }
}
