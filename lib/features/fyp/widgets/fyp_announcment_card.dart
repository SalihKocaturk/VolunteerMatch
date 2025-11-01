import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_card.dart';
import '../models/fyp_announcement.dart';

class FypAnnouncementCard extends StatelessWidget {
  final FypAnnouncement announcement;
  final VoidCallback? onTap;

  const FypAnnouncementCard({
    super.key,
    required this.announcement,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      backgroundColor: const Color(0xFFFDF6EE),
      borderRadius: 14,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              announcement.imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              announcement.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.text,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              announcement.content,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onTap,
                child: const Text(
                  'Detaylı Gör',
                  style: TextStyle(
                    color: AppColors.seed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
