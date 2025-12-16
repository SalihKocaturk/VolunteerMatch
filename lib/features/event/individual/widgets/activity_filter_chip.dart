import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ActivityFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ActivityFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
        label: Text(label),
        labelStyle: TextStyle(
          color: isSelected ? AppColors.white : AppColors.text,
          fontWeight: FontWeight.w600,
        ),
        selected: isSelected,
        backgroundColor: AppColors.beige,
        selectedColor: AppColors.seed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: isSelected
                ? AppColors.seed
                : AppColors.forest.withOpacity(0.25),
          ),
        ),
        onSelected: (_) => onTap(),
      ),
    );
  }
}
