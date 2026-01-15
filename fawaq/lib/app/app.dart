import 'package:flutter/material.dart';
import '../ui/theme/app_theme.dart';
import 'router.dart';

class FawaqApp extends StatelessWidget {
  const FawaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAWAQ',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}