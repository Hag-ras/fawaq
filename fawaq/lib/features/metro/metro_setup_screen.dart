import 'package:flutter/material.dart';
import '../../ui/components/app_scaffold.dart';
import '../../ui/components/primary_button.dart';
import '../../ui/tokens/spacing.dart';
import 'widgets/metro_back_button.dart';
import 'widgets/metro_destination_section.dart';
import 'widgets/metro_alert_timing_section.dart';

class MetroSetupScreen extends StatelessWidget {
  const MetroSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const MetroBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const MetroDestinationSection(
            stationName: 'Select Station',
          ),
          SizedBox(height: AppSpacing.lg),
          const MetroAlertTimingSection(),
        ],
      ),
      bottom: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: PrimaryButton(
          label: 'START TRIP',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/metro/active');
          },
        ),
      ),
    );
  }
}