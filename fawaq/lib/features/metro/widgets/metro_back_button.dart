import 'package:flutter/material.dart';
import '../../../ui/tokens/colors.dart';

class MetroBackButton extends StatelessWidget {
  const MetroBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back_ios),
      color: AppColors.textPrimaryDark,
    );
  }
}
