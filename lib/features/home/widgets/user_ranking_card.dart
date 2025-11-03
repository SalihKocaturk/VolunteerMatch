import 'package:flutter/material.dart';
import 'package:prologue/features/home/widgets/user_level_section.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';

class UserRankingCard extends StatelessWidget {
  final String username;
  final int rank;
  final int points;

  const UserRankingCard({
    super.key,
    required this.username,
    required this.rank,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: CustomCard(
        backgroundColor: const Color(0xFFFDF6EE),
        borderRadius: 16,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.seed.withOpacity(0.15),
                  child: const Icon(
                    Icons.emoji_events_rounded,
                    color: AppColors.seed,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.text,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sıra: $rank  •  Puan: $points',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.seed.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '20. seviye',
                    style: TextStyle(
                      color: AppColors.seed,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            UserLevelSection(),
          ],
        ),
      ),
    );
  }
}
