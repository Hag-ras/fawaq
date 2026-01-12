import 'package:flutter/material.dart';
import '../tokens/colors.dart';
import '../tokens/spacing.dart';
import '../tokens/radius.dart';
import '../tokens/typography.dart';

class ModeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const ModeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: AppSpacing.lg,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppRadius.xlRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: AppSpacing.md,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 48,
                color: iconColor,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: AppText.h2.copyWith(color: AppColors.textPrimaryDark),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              subtitle,
              style:
                  AppText.body.copyWith(color: AppColors.textSecondaryDark),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
