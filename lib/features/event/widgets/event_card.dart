import 'package:flutter/material.dart';
import 'package:prologue/core/widgets/custom_card.dart';

import '../../../core/constants/app_colors.dart';
import '../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onJoin;

  const EventCard({super.key, required this.event, required this.onJoin});

  Color _importanceColor(EventImportance importance) {
    switch (importance) {
      case EventImportance.low:
        return AppColors.green;
      case EventImportance.medium:
        return AppColors.blue;
      case EventImportance.high:
        return AppColors.red;
    }
  }

  String _importanceLabel(EventImportance importance) {
    switch (importance) {
      case EventImportance.low:
        return 'Düşük Öncelik';
      case EventImportance.medium:
        return 'Orta Öncelik';
      case EventImportance.high:
        return 'Yüksek Öncelik';
    }
  }

  String _joinButtonText(EventJoinState state) {
    switch (state) {
      case EventJoinState.notJoined:
        return 'Başvur';
      case EventJoinState.pending:
        return 'Onay Bekliyor';
      case EventJoinState.joined:
        return 'Katılım Onaylandı';
    }
  }

  Color _joinButtonColor(EventJoinState state) {
    switch (state) {
      case EventJoinState.notJoined:
        return AppColors.seed;
      case EventJoinState.pending:
        return const Color(0xFFFFC107); // amber
      case EventJoinState.joined:
        return AppColors.forest;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _importanceColor(event.importance);

    return CustomCard(
      // color: AppColors.white,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(16),
      //   side: BorderSide(color: AppColors.forest.withOpacity(0.3), width: 0.8),
      // ),
      // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      // elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                event.imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 160,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              event.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              event.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${event.date.day}.${event.date.month}.${event.date.year}',
                  style: const TextStyle(fontSize: 13, color: AppColors.forest),
                ),
                Text(
                  event.location,
                  style: const TextStyle(fontSize: 13, color: AppColors.forest),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _importanceLabel(event.importance),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ),
                Text(
                  'Puan: ${event.points}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onJoin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _joinButtonColor(event.joinState),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _joinButtonText(event.joinState),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
