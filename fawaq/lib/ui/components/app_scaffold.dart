import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottom;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.screen,
          child: body,
        ),
      ),
      bottomNavigationBar: bottom,
    );
  }
}
