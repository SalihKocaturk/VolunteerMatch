import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/avatar_widget.dart'; // 👈 senin avatarını ekledik
import '../../../core/widgets/custom_card.dart';
import '../models/fyp_award.dart';

class FypAwardCard extends StatelessWidget {
  final FypAward award;
  const FypAwardCard({super.key, required this.award});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: const Color(0xFFFDF6EE),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 👇 AvatarWidget artık imageUrl veya isimden avatar oluşturuyor
            AvatarWidget(
              imagePath: award.imageUrl.isNotEmpty ? null : award.imageUrl,
              name: award.username,
              size: 56,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    award.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${award.username} • ${award.points} puan',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.forest,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    award.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
