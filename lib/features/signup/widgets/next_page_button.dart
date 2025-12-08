import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class NextButton extends StatelessWidget {
  final bool enabled;
  final bool isLast;
  final VoidCallback onPressed;

  const NextButton({
    super.key,
    required this.enabled,
    required this.isLast,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? AppColors.seed
              : AppColors.seed.withOpacity(.35),
          disabledBackgroundColor: AppColors.seed.withOpacity(.35),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          isLast ? 'Kaydı Tamamla' : 'Devam Et',
          style: TextStyle(
            color: AppColors.white.withOpacity(enabled ? 1 : 0.7),
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
