import 'package:flutter/material.dart';
import 'desing_system/theme/theme.dart';
import 'features/home/presenter/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicionário',
      theme: lightTheme(context),
      home: const HomePage(),
    );
  }
}
