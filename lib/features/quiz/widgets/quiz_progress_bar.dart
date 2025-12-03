import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class QuizProgressBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuizProgressBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = currentPage / totalPages;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display text
        Text(
          'Sayfa $currentPage / $totalPages',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),

        // PREMIUM PROGRESS BAR
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: AppColors.seed.withOpacity(.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              tween: Tween(begin: 0, end: progress),
              builder: (_, value, __) => FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(color: AppColors.seed),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
