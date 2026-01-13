import 'package:flutter/material.dart';

import '../../../ui/tokens/colors.dart';
import '../../../ui/tokens/spacing.dart';

class MetroAlertTimingSection extends StatefulWidget {
  const MetroAlertTimingSection({super.key});

  @override
  State<MetroAlertTimingSection> createState() =>
      _MetroAlertTimingSectionState();
}

class _MetroAlertTimingSectionState extends State<MetroAlertTimingSection> {
  int _selectedStations = 1;
  bool _isCustom = false;

  final TextEditingController _controller =
      TextEditingController(text: '3');

  static const int _minStations = 1;
  static const int _maxStations = 6;

  void _selectPreset(int value) {
    setState(() {
      _isCustom = false;
      _selectedStations = value;
    });
  }

  void _selectCustom() {
    setState(() {
      _isCustom = true;
      _selectedStations = int.tryParse(_controller.text) ?? _minStations;
    });
  }

  void _onCustomChanged(String value) {
    final parsed = int.tryParse(value);
    if (parsed == null) return;

    final clamped = parsed.clamp(_minStations, _maxStations);
    setState(() {
      _selectedStations = clamped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WAKE ME UP',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.textSecondaryDark,
                letterSpacing: 2,
              ),
        ),
        SizedBox(height: AppSpacing.md),

        _OptionCard(
          label: 'Before 1 station',
          selected: !_isCustom && _selectedStations == 1,
          onTap: () => _selectPreset(1),
        ),

        _OptionCard(
          label: 'Before 2 stations',
          selected: !_isCustom && _selectedStations == 2,
          onTap: () => _selectPreset(2),
        ),

        _CustomOptionCard(
          controller: _controller,
          selected: _isCustom,
          min: _minStations,
          max: _maxStations,
          onTap: _selectCustom,
          onChanged: _onCustomChanged,
        ),
      ],
    );
  }
}

class _OptionCard extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _OptionCard({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSpacing.sm),
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.borderDark,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: AppColors.primary,
            ),
            SizedBox(width: AppSpacing.md),
            Text(
              label,
              style: TextStyle(
                color: AppColors.textPrimaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomOptionCard extends StatelessWidget {
  final TextEditingController controller;
  final bool selected;
  final int min;
  final int max;
  final VoidCallback onTap;
  final ValueChanged<String> onChanged;

  const _CustomOptionCard({
    required this.controller,
    required this.selected,
    required this.min,
    required this.max,
    required this.onTap,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.borderDark,
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: AppColors.primary,
            ),
            SizedBox(width: AppSpacing.md),
            const Text(
              'Before',
              style: TextStyle(
                color: AppColors.textPrimaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            SizedBox(
              width: 48,
              child: TextField(
                controller: controller,
                enabled: selected,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textPrimaryDark,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.borderDark,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Text(
              'stations',
              style: TextStyle(
                color: AppColors.textPrimaryDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              '$min–$max',
              style: TextStyle(
                color: AppColors.textSecondaryDark,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
