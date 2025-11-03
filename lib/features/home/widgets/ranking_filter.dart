import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class RankingFilter extends StatelessWidget {
  final int index; // 0: Daily, 1: Weekly, 2: All
  final ValueChanged<int> onChanged;

  const RankingFilter({
    super.key,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final labels = const ['Günlük', 'Haftalık', 'Tümü'];

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.seed.withOpacity(.12)),
      ),
      child: Row(
        children: List.generate(labels.length, (i) {
          final selected = i == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.seed.withOpacity(.14)
                      : AppColors.white.withOpacity(0),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text(
                  labels[i],
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: selected ? AppColors.forest : AppColors.text,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
