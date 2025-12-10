import 'package:flutter/material.dart';
import 'package:prologue/core/constants/app_colors.dart';

class OrgStepIndicator extends StatelessWidget {
  final int currentStep; // 0 veya 1

  const OrgStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    const labels = ['Kurum', 'Yetkili'];

    return Row(
      children: List.generate(2, (i) {
        final bool active = i == currentStep;
        return Expanded(
          child: Row(
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? AppColors.seed
                      : AppColors.seed.withOpacity(.16),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${i + 1}',
                  style: TextStyle(
                    color: active ? AppColors.white : AppColors.forest,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                labels[i],
                style: TextStyle(
                  color: active
                      ? AppColors.text
                      : AppColors.forest.withOpacity(.8),
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              if (i != 1) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: i < currentStep
                          ? AppColors.seed
                          : AppColors.seed.withOpacity(.20),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}
