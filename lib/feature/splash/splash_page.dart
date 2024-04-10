import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kb_bank_clone/assets/assets.gen.dart';
import 'package:kb_bank_clone/utils/router/app_route.dart';


@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const kSplashDuration = Duration(milliseconds: 2600);
  static const routeName = '/';


  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(SplashPage.kSplashDuration, () {
      if (mounted) {
        context.router.replace(const HomeRoute());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    const color = Color(0xFFFFDC49);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: color,
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: ColoredBox(
        color: color,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 145),
            child: AspectRatio(
              aspectRatio: 1.6,
              child: Assets.images.splashLogo.image(fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ),
    );
  }
}
