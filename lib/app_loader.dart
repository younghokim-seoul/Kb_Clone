import 'package:flutter/material.dart';
import 'package:kb_bank_clone/feature/splash/splash_page.dart';
import 'package:kb_bank_clone/main.dart';
import 'package:kb_bank_clone/utils/dev_log.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({
    required this.dataLoader,
    super.key,
  });

  final Future<void> Function() dataLoader;

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  bool? _isComplete;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  void _subscribe() {
    widget.dataLoader().then((data) {
      Future.delayed(SplashPage.kSplashDuration, () {
          if (mounted) {
            setState(() => _isComplete = true);
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = _isComplete;

    Log.i("::data  $data");

    if (data == null) {
      return const SplashPage();
    }

    return const MyApp();
  }
}
