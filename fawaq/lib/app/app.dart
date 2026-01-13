import 'package:flutter/material.dart';

import 'router.dart';
import '../ui/theme/app_theme.dart';

class FawaqApp extends StatelessWidget {
  const FawaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
