import 'package:flutter/material.dart';

import '../../ui/components/app_scaffold.dart';
import '../../ui/components/primary_button.dart';
import '../../ui/tokens/spacing.dart';

import 'widgets/metro_destination_section.dart';
import 'widgets/metro_alert_timing_section.dart';

class MetroSetupScreen extends StatelessWidget {
  const MetroSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          SizedBox(height: AppSpacing.xl),
          const MetroDestinationSection(),
          SizedBox(height: AppSpacing.xl),
          const MetroAlertTimingSection(),
          const Spacer(),
          PrimaryButton(
            label: 'START TRIP',
            onPressed: () {
              Navigator.pushNamed(context, '/metro/active');
            },
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        const Spacer(),
        const Text(
          'Metro Mode',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
