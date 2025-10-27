import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';

class AchievementsStrip extends StatelessWidget {
  const AchievementsStrip({
    super.key,
    required this.currentPoints,
    required this.nextTarget,
    required this.badges,
  });

  final int currentPoints;
  final int nextTarget;
  final List<IconData> badges;
  static const TextStyle _counterStyle = TextStyle(
    color: AppColors.text,
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: badges.map((ic) {
                return CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.seed.withAlpha(32),
                  child: Icon(ic, color: AppColors.seed),
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: 230 / 267,
                      valueColor: const AlwaysStoppedAnimation(AppColors.seed),
                      backgroundColor: AppColors.seed.withAlpha(32),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${math.min(currentPoints, nextTarget)} / $nextTarget',
                  style: _counterStyle,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Hedefe kalan puanları gör',
                  style: TextStyle(color: AppColors.text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
