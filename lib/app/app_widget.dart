import 'package:flutter/material.dart';
import 'desing_system/theme/theme.dart';
import 'features/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const SplashPage(),
    );
  }
}
