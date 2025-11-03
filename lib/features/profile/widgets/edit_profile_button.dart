import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.edit_rounded),
      label: const Text(
        'Profili Düzenle',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.seed,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        shadowColor: AppColors.seed.withOpacity(.4),
        elevation: 4,
      ),
    );
  }
}
