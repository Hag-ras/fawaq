import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../ui/tokens/colors.dart';
import '../../../ui/tokens/spacing.dart';
import '../../../ui/tokens/radius.dart';

class MetroAlertTimingSection extends StatefulWidget {
  const MetroAlertTimingSection({super.key});

  @override
  State<MetroAlertTimingSection> createState() => _MetroAlertTimingSectionState();
}

class _MetroAlertTimingSectionState extends State<MetroAlertTimingSection> {
  int selectedOption = 1;
  final TextEditingController customStationsController = TextEditingController();

  @override
  void dispose() {
    customStationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: AppSpacing.md),
          child: Text(
            'WAKE ME UP',
            style: TextStyle(
              color: AppColors.textSecondaryDark,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        _buildTimingOption(
          optionNumber: 1,
          label: 'Before 1 station',
        ),
        SizedBox(height: AppSpacing.sm),
        _buildTimingOption(
          optionNumber: 2,
          label: 'Before 2 stations',
        ),
        SizedBox(height: AppSpacing.sm),
        _buildCustomTimingOption(),
      ],
    );
  }

  Widget _buildTimingOption({
    required int optionNumber,
    required String label,
  }) {
    final isSelected = selectedOption == optionNumber;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = optionNumber;
        });
      },
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? Colors.white : AppColors.textSecondaryDark,
            ),
            SizedBox(width: AppSpacing.md),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimaryDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomTimingOption() {
    final isSelected = selectedOption == 3;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = 3;
        });
      },
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? Colors.white : AppColors.textSecondaryDark,
            ),
            SizedBox(width: AppSpacing.md),
            Text(
              'Before',
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimaryDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            SizedBox(
              width: 60,
              child: TextField(
                controller: customStationsController,
                enabled: isSelected,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textSecondaryDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: '3',
                  hintStyle: TextStyle(
                    color: isSelected 
                        ? Colors.white.withOpacity(0.5)
                        : AppColors.textSecondaryDark.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Text(
              'stations',
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textPrimaryDark,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}