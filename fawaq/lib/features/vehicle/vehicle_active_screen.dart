import 'package:flutter/material.dart';
import '../../ui/components/app_scaffold.dart';
import '../../ui/components/primary_button.dart';
import '../../ui/tokens/colors.dart';
import '../../ui/tokens/spacing.dart';
import '../../ui/tokens/radius.dart';
import 'widgets/vehicle_status_indicator.dart';
import 'widgets/vehicle_destination_section.dart';

class VehicleActiveScreen extends StatelessWidget {
  const VehicleActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VehicleStatusIndicator(),
          SizedBox(height: AppSpacing.lg),
          const VehicleDestinationSection(
            placeName: 'Cairo Festival City',
          ),
          SizedBox(height: AppSpacing.lg),
          _buildDistanceTimeCard(),
        ],
      ),
      bottom: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: PrimaryButton(
          label: 'STOP TRIP',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (route) => false,
            );
          },
          backgroundColor: AppColors.danger,
        ),
      ),
    );
  }

  Widget _buildDistanceTimeCard() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
      child: Column(
        children: [
          Text(
            'REMAINING',
            style: TextStyle(
              color: AppColors.textSecondaryDark,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMetric('2.5', 'km'),
              Container(
                width: 1,
                height: 60,
                color: AppColors.textSecondaryDark.withOpacity(0.3),
              ),
              _buildMetric('8', 'min'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Text(
          unit,
          style: TextStyle(
            color: AppColors.textPrimaryDark,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}