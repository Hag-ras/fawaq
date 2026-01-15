import 'package:flutter/material.dart';
import '../../../ui/tokens/colors.dart';

class MetroBackButton extends StatelessWidget {
  const MetroBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      color: AppColors.textPrimaryDark,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}