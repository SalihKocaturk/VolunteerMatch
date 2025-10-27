import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class TutorialStepBlock extends StatelessWidget {
  final Color color;
  final String title;
  final String text;
  const TutorialStepBlock({
    super.key,
    required this.color,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          text,
          textAlign: TextAlign.center,
          style: t.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.darkBg,
          ),
        ),
      ],
    );
  }
}
