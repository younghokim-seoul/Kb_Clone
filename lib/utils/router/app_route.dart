import 'package:auto_route/auto_route.dart';
import 'package:kb_bank_clone/feature/home/home_page.dart';
import 'package:kb_bank_clone/feature/splash/splash_page.dart';

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
          page: HomeRoute.page,
          // TransitionsBuilders class contains a preset of common transitions builders.
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 400,
        )
        // AutoRoute(
        //   path: HomePage.routeName,
        //   page: HomeRoute.page,
        // ),
      ];
}
