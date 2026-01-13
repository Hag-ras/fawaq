import 'package:flutter/material.dart';
import '../../../ui/tokens/colors.dart';
import '../../../ui/tokens/spacing.dart';

class MetroStatusIndicator extends StatelessWidget {
  const MetroStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.location_on,
            color: AppColors.primary,
            size: 16,
          ),
          SizedBox(width: AppSpacing.sm),
          Text(
            'Tracking in background',
            style: TextStyle(
              color: AppColors.textSecondaryDark,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
