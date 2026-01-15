import 'package:flutter/material.dart';
import '../../ui/components/app_scaffold.dart';
import '../../ui/components/primary_button.dart';
import '../../ui/tokens/colors.dart';
import '../../ui/tokens/spacing.dart';
import 'widgets/vehicle_destination_section.dart';
import 'widgets/vehicle_distance_section.dart';

class VehicleSetupScreen extends StatelessWidget {
  const VehicleSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.textPrimaryDark,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VehicleDestinationSection(
            placeName: 'Select Destination',
          ),
          SizedBox(height: AppSpacing.lg),
          const VehicleDistanceSection(),
        ],
      ),
      bottom: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: PrimaryButton(
          label: 'START TRIP',
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/vehicle/active');
          },
        ),
      ),
    );
  }
}