import 'package:flutter/material.dart';
import '../../../ui/tokens/colors.dart';
import '../../../ui/tokens/spacing.dart';

class MetroDestinationSection extends StatelessWidget {
  const MetroDestinationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DESTINATION',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.textSecondaryDark,
                letterSpacing: 2,
              ),
        ),
        SizedBox(height: AppSpacing.sm),
        Text(
          'Central Station',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textPrimaryDark,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
