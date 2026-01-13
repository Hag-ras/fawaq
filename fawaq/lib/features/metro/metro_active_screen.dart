import 'package:flutter/material.dart';

import '../../ui/components/app_scaffold.dart';
import '../../ui/tokens/spacing.dart';

import 'widgets/metro_destination_section.dart';
import 'widgets/metro_distance_card.dart';
import 'widgets/metro_status_indicator.dart';

class MetroActiveScreen extends StatelessWidget {
  const MetroActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          const MetroStatusIndicator(),
          SizedBox(height: AppSpacing.xl),
          const MetroDestinationSection(),
          SizedBox(height: AppSpacing.xl),
          const MetroDistanceCard(),
          const Spacer(),
          _StopTripButton(),
        ],
      ),
    );
  }
}

class _StopTripButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('STOP TRIP'),
      ),
    );
  }
}
