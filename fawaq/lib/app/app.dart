import 'package:flutter/material.dart';
import '../ui/theme/app_theme.dart';
import '../features/home/home_screen.dart';

class FawaqApp extends StatelessWidget {
  const FawaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const HomeScreen(),
    );
  }
}
