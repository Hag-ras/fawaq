import 'package:flutter/material.dart';
import '../../../ui/tokens/colors.dart';
import '../../../ui/tokens/spacing.dart';

class MetroDistanceCard extends StatelessWidget {
  const MetroDistanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'DISTANCE REMAINING',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textSecondaryDark,
                  letterSpacing: 2,
                ),
          ),
          SizedBox(height: AppSpacing.md),
          RichText(
            text: TextSpan(
              text: '1.2 ',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppColors.textPrimaryDark,
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: 'km',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
