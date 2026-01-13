import 'package:flutter/material.dart';

import '../../ui/components/app_scaffold.dart';
import '../../ui/components/mode_card.dart';
import '../../ui/tokens/colors.dart';
import '../../ui/tokens/spacing.dart';
import '../metro/metro_setup_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ModeCard(
              icon: Icons.subway,
              title: 'Metro Mode',
              subtitle: 'Station-based alarms',
              backgroundColor: AppColors.primary,
              iconBackgroundColor: Colors.white.withOpacity(0.2),
              iconColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MetroSetupScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: ModeCard(
              icon: Icons.directions_bus,
              title: 'Vehicle Mode',
              subtitle: 'GPS distance alarms',
              backgroundColor: AppColors.surfaceDark,
              iconBackgroundColor: AppColors.primary.withOpacity(0.15),
              iconColor: AppColors.primary,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
