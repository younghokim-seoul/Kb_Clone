import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kb_bank_clone/app_provider.dart';
import 'package:kb_bank_clone/data/local/kb_database.dart';
import 'package:kb_bank_clone/di/kb_service.dart';
import 'package:kb_bank_clone/theme/demo_colors.dart';
import 'package:kb_bank_clone/theme/demo_text_styles.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = await $FloorAppDatabase.databaseBuilder('kb.db').build();
  registerServiceInstance(db);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 피그마에 디자인된 앱 프레임 사이즈로 맞춰서 적용하면 됨
      minTextAdapt: true, // 텍스트 크기를 자동으로 조정하여 화면에 맞추는 기능을 활성화
      splitScreenMode: true, //분할 모드 활성화
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: ref.watch(routerProvider).config(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ko', ''), // Korean, no country code
        ],
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: DemoColors.primaryColor,
          textTheme: DemoTextStyles.textTheme,
        ),
        builder: (context, child) {
          Log.d(":::child..  $child");
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: DemoColors.primaryColor,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: DemoColors.primaryColor,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: child!,
          );
        },
      ),
    );
  }
}
