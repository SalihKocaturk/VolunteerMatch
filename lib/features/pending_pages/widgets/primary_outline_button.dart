import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class PrimaryOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.seed, width: 1.4),
          foregroundColor: AppColors.seed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.seed,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
