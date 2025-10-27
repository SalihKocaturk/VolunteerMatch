import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class TutorialStepIndicator extends StatelessWidget {
  final int total, currentIndex;
  const TutorialStepIndicator({
    super.key,
    required this.total,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      children: List.generate(total, (i) {
        final active = i == currentIndex;
        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 8,
            margin: EdgeInsets.only(
              left: i == 0 ? 0 : 6,
              right: i == total - 1 ? 0 : 6,
            ),
            decoration: BoxDecoration(
              color: active
                  ? (AppColors.primary ?? cs.primary)
                  : cs.surfaceVariant.withAlpha(4),
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        );
      }),
    );
  }
}
