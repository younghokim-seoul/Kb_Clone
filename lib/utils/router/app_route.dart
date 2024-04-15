import 'package:auto_route/auto_route.dart';
import 'package:kb_bank_clone/feature/home/home_page.dart';
import 'package:kb_bank_clone/feature/setting/setting_page.dart';
import 'package:kb_bank_clone/feature/splash/splash_page.dart';
import 'package:kb_bank_clone/feature/usage/card_usage_details_page.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_details/usage_fee_detail_page.dart';
import 'package:kb_bank_clone/feature/usage/statement/usage_fee_statement_page.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: SplashPage.routeName,
          page: SplashRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: HomePage.routeName,
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 400,
        ),
        CupertinoRoute(
          path: SettingPage.routeName,
          page: SettingRoute.page,
        ),
        CupertinoRoute(
          path: CardUsageDetailsPage.routeName,
          page: CardUsageDetailsRoute.page,
        ),
        CupertinoRoute(
          path: UsageFeeStatementPage.routeName,
          page: UsageFeeStatementRoute.page,
        ),
        CupertinoRoute(
          path: UsageFeeDetailsPage.routeName,
          page: UsageFeeDetailsRoute.page,
        )
      ];
}
