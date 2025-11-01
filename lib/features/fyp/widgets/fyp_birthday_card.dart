import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';

class FypBirthdayCard extends StatelessWidget {
  const FypBirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: const Color(0xFFFDF6EE),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.seed.withOpacity(0.15),
              child: const Icon(
                Icons.cake_rounded,
                color: AppColors.seed,
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bugün doğum günü olan gönüllü!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'İlk 3 sıraya girersen doğum günün tüm toplulukta kutlanır 🎉',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      height: 1.4,
                    ),
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
