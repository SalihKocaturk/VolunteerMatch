import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../models/achivement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement model;

  const AchievementCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade100.withOpacity(0.7),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(model.icon, color: Colors.white, size: 32),
            const SizedBox(height: 6),
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
