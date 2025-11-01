import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';
import '../models/fyp_contribution.dart';

class FypContributionCard extends StatelessWidget {
  final FypContribution contribution;
  const FypContributionCard({super.key, required this.contribution});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: const Color(0xFFFDF6EE),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Image.network(
              contribution.iconUrl,
              height: 42,
              width: 42,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contribution.category,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.text,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${contribution.count} katkı yapıldı',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.forest,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    contribution.description,
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
