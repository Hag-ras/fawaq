import 'package:flutter/material.dart';
import '../../ui/components/app_scaffold.dart';
import '../../ui/components/primary_button.dart';
import '../../ui/tokens/colors.dart';
import '../../ui/tokens/spacing.dart';
import 'widgets/metro_status_indicator.dart';
import 'widgets/metro_destination_section.dart';
import 'widgets/metro_distance_card.dart';

class MetroActiveScreen extends StatelessWidget {
  const MetroActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MetroStatusIndicator(),
          SizedBox(height: AppSpacing.lg),
          const MetroDestinationSection(
            stationName: 'Heliopolis',
          ),
          SizedBox(height: AppSpacing.lg),
          const MetroDistanceCard(
            stationsRemaining: 3,
          ),
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
}