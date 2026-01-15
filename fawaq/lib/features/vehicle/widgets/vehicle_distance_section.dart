import 'package:flutter/material.dart';
import '../../../ui/tokens/colors.dart';
import '../../../ui/tokens/spacing.dart';
import '../../../ui/tokens/radius.dart';

class VehicleDistanceSection extends StatefulWidget {
  const VehicleDistanceSection({super.key});

  @override
  State<VehicleDistanceSection> createState() => _VehicleDistanceSectionState();
}

class _VehicleDistanceSectionState extends State<VehicleDistanceSection> {
  double distanceKm = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.md),
          child: Text(
            'WAKE ME BEFORE',
            style: TextStyle(
              color: AppColors.textSecondaryDark,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: Column(
            children: [
              Text(
                '${distanceKm.toStringAsFixed(1)} km',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppSpacing.md),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: AppColors.primary,
                  inactiveTrackColor: AppColors.textSecondaryDark.withOpacity(0.3),
                  thumbColor: AppColors.primary,
                  overlayColor: AppColors.primary.withOpacity(0.2),
                  trackHeight: 4,
                ),
                child: Slider(
                  value: distanceKm,
                  min: 0.5,
                  max: 20.0,
                  divisions: 39,
                  onChanged: (value) {
                    setState(() {
                      distanceKm = value;
                    });
                  },
                ),
              ),
              SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0.5 km',
                    style: TextStyle(
                      color: AppColors.textSecondaryDark,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '20 km',
                    style: TextStyle(
                      color: AppColors.textSecondaryDark,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}