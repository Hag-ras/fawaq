import 'package:flutter/material.dart';
import '../../ui/components/app_scaffold.dart';
import '../../ui/components/mode_card.dart';
import '../../ui/tokens/spacing.dart';
import '../../ui/tokens/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FAWAQ',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Choose your commute mode',
            style: TextStyle(
              color: AppColors.textSecondaryDark,
              fontSize: 16,
            ),
          ),
          SizedBox(height: AppSpacing.xl),
          ModeCard(
            icon: Icons.train,
            title: 'Metro',
            description: 'Wake me before my station',
            onTap: () {
              Navigator.pushNamed(context, '/metro/setup');
            },
          ),
          SizedBox(height: AppSpacing.md),
          ModeCard(
            icon: Icons.directions_car,
            title: 'Vehicle',
            description: 'Wake me before my destination',
            onTap: () {
              Navigator.pushNamed(context, '/vehicle/setup');
            },
          ),
        ],
      ),
    );
  }
}